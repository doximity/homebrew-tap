#!/usr/bin/env bash
# Bump Casks/doximity.rb to the current stable Doximity Desktop release.
# Downloads the release DMG and recomputes its sha256; does not commit.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cask="${script_dir}/../Casks/doximity.rb"
feed_base="https://updates.doximity.com/desktop/stable/mac-arm64"

manifest="$(curl -fsSL "${feed_base}/stable-mac.yml")"

new_version="$(printf '%s\n' "${manifest}" | awk -F': ' '/^version:/{print $2; exit}')"
# Take the url: value from the files: entry that ends in .dmg (do not construct the name).
dmg_name="$(printf '%s\n' "${manifest}" | awk -F': ' '/url: /{gsub(/[[:space:]]/,"",$2); if ($2 ~ /\.dmg$/) print $2}' | head -n1)"

[[ -n "${new_version}" ]] || {
  echo "error: could not read version from manifest" >&2
  exit 1
}
[[ -n "${dmg_name}" ]] || {
  echo "error: no .dmg entry in manifest" >&2
  exit 1
}

cur_version="$(sed -nE 's/^  version "([^"]+)"/\1/p' "${cask}")"

if [[ "${cur_version}" = "${new_version}" ]]
then
  echo "already up to date (version ${new_version})"
  exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT

dmg_path="${tmp}/${dmg_name}"
curl -fsSL -o "${dmg_path}" "${feed_base}/${dmg_name}"
if command -v shasum >/dev/null 2>&1; then
  new_sha256="$(shasum -a 256 "${dmg_path}" | awk '{print $1}')"
else
  new_sha256="$(sha256sum "${dmg_path}" | awk '{print $1}')"
fi

# In-place edit, honoring both GNU sed (Linux) and BSD/macOS sed
if sed --version >/dev/null 2>&1; then
  sed -i -E \
    -e "s/^  version \"[^\"]*\"/  version \"${new_version}\"/" \
    -e "s/^  sha256 \"[^\"]*\"/  sha256 \"${new_sha256}\"/" \
    "${cask}"
else
  sed -i '' -E \
    -e "s/^  version \"[^\"]*\"/  version \"${new_version}\"/" \
    -e "s/^  sha256 \"[^\"]*\"/  sha256 \"${new_sha256}\"/" \
    "${cask}"
fi

echo "bumped ${cur_version} -> ${new_version}"
echo "sha256: ${new_sha256}"

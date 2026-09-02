# Homebrew Tap — Doximity Desktop

A Homebrew tap for the [Doximity Desktop](https://www.doximity.com/desktop) macOS app — the Clinical AI suite (Ask, Scribe, Dialer, and Fax).

This tap installs the official, signed and notarized universal DMG from Doximity's update feed. The app itself is not open source, so this is a **Cask**, not a formula.

## Install

The one-liner taps and installs in a single step:

```bash
brew install --cask doximity/tap/doximity
```

Or, explicitly tap first and then install:

```bash
brew tap doximity/tap
brew install --cask doximity/tap/doximity
```

## Notes

- The app self-updates via its built-in updater (`auto_updates true`), so `brew upgrade --greedy` reconciles the cask with the installed version if desired.
- Once this cask is accepted upstream into `homebrew/cask`, it becomes a plain `brew install --cask doximity` without needing this tap.
- If/when this tap moves to the `doximity` org, the install line becomes `brew install --cask doximity/tap/doximity`.
- Homebrew may print a tap-trust notice for developer commands; the fully-qualified install command above trusts only this cask. Optionally run `brew trust doximity/tap` to trust the whole tap.

## Updating the cask

When a new stable release is published, run `bin/bump.sh` to bump `Casks/doximity.rb` to the current version and recompute its `sha256`. It does not commit — review and commit the change yourself (or let CI do it).

A daily GitHub Actions workflow (`.github/workflows/bump-cask.yml`) checks for new stable releases and opens a PR automatically; it can also be run manually from the Actions tab ("Bump doximity cask" → Run workflow), and `bin/bump.sh` remains available for local bumps.

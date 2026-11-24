cask "doximity" do
  version "2.0.8"
  sha256 "fa703005e0a0a462775405afb951c3ddfe6da4e51d8bdf9b38c1fac77a199b52"

  url "https://updates.doximity.com/desktop/stable/mac-arm64/Doximity-#{version}-universal.dmg"
  name "Doximity Desktop"
  desc "Clinical AI suite: Ask, Scribe, Dialer, and Fax"
  homepage "https://www.doximity.com/desktop"

  livecheck do
    url "https://updates.doximity.com/desktop/stable/mac-arm64/stable-mac.yml"
    regex(/^version:\s*v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on macos: :big_sur

  app "Doximity.app"

  zap trash: [
    "~/Library/Application Support/Doximity",
    "~/Library/Caches/com.doximity.desktop",
    "~/Library/Logs/Doximity",
    "~/Library/Preferences/com.doximity.desktop.plist",
    "~/Library/Saved Application State/com.doximity.desktop.savedState",
  ]
end

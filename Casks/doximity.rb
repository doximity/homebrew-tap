cask "doximity" do
  version "1.3.6"
  sha256 "245c0b90782723f7e939900b11905f24a4b34a60b4fd767fd487046008aae8df"

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

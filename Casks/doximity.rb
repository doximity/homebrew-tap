cask "doximity" do
  version "1.4.11"
  sha256 "54b91e31478a5f86fd41f56799d1a9969ee3127324ae3946819525282b413867"

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

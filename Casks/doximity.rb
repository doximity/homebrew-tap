cask "doximity" do
  version "1.3.8"
  sha256 "4347d7fdc73fe4840e14cb6da10221a576ad37acd7ccea6e8e824d93225614fc"

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

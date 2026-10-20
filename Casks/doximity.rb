cask "doximity" do
  version "1.4.6"
  sha256 "633aad9cfe290f268f048b871ddcf5e25dde42fdc169192a06471961778cf771"

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

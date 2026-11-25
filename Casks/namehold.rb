cask "namehold" do
  version "0.8.1"
  sha256 "88788dc8ffc197b7dcc93bf69ad6493c868dddb072af4c454500c1533c0edff5"

  url "https://github.com/DimazzzZ/namehold-wallet/releases/download/v#{version}/Namehold_#{version}_universal.dmg"
  name "Namehold"
  desc "Non-custodial Handshake (HNS) wallet and TLD manager"
  homepage "https://github.com/DimazzzZ/namehold-wallet"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Namehold.app"

  # ~/.namehold holds the wallet database and is deliberately left out of zap.
  zap trash: [
    "~/Library/Caches/org.zhavoronkov.nameholdwallet",
    "~/Library/Preferences/org.zhavoronkov.nameholdwallet.plist",
    "~/Library/Saved Application State/org.zhavoronkov.nameholdwallet.savedState",
    "~/Library/WebKit/org.zhavoronkov.nameholdwallet",
  ]

  caveats <<~EOS
    Namehold is not signed with an Apple Developer ID, so macOS blocks the first launch.
    Allow it once with:
      xattr -dr com.apple.quarantine "#{appdir}/Namehold.app"
    or open it via System Settings > Privacy & Security > Open Anyway.
  EOS
end

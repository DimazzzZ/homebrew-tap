cask "namehold" do
  version "0.8.0"
  sha256 "d9d8d3694c5237c1a1d3eb5bfccc5f84f9cecdb0eb2c45e0e402a1f32662798c"

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

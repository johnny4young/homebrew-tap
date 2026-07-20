cask "gancho" do
  version "0.8.0"
  sha256 "b0307fdbf8c41b149a0862dd2a8c30f0f0b9f9e8d4f11625d354bf0b1eb3ed5a"

  url "https://github.com/johnny4young/gancho/releases/download/v#{version}/Gancho-#{version}.dmg"
  name "Gancho"
  desc "Privacy-first smart clipboard manager"
  homepage "https://github.com/johnny4young/gancho"

  # Stable GitHub release-tag URLs, so livecheck tracks new versions from the
  # releases page.
  livecheck do
    url :url
    strategy :github_latest
  end

  # Gancho keeps itself current in place via Sparkle (direct-download channel),
  # so Homebrew should not flag user-updated copies as outdated.
  auto_updates true
  depends_on macos: :tahoe

  app "Gancho.app"
  # The `gancho` CLI + local MCP server ships inside the bundle. It is named
  # gancho-cli there so it does not collide with the `Gancho` app executable on
  # case-insensitive APFS; surface it on PATH under its real name.
  binary "#{appdir}/Gancho.app/Contents/MacOS/gancho-cli", target: "gancho"

  zap trash: [
    "~/Library/Application Support/Gancho",
    "~/Library/Caches/com.johnny4young.gancho",
    "~/Library/HTTPStorages/com.johnny4young.gancho",
    "~/Library/Preferences/com.johnny4young.gancho.menubar-helper.plist",
    "~/Library/Preferences/com.johnny4young.gancho.plist",
  ]
end

cask "secreteo" do
  version "1.2.0"
  sha256 "c9ce31edd38db605a3f13b5f90c038756accdb7fab85bd17f8c89e1fff6c5f39"

  url "https://github.com/johnny4young/secreteo/releases/download/v#{version}/Secreteo-#{version}.dmg"
  name "Secreteo"
  desc "Local, private dictation from the menu bar"
  homepage "https://github.com/johnny4young/secreteo"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Secreteo.app"

  uninstall quit: "com.johnny4young.secreteo"

  # The shared models folder also belongs to other apps, so it stays out of zap.
  zap trash: [
    "~/Library/Application Support/com.johnny4young.secreteo",
    "~/Library/Caches/com.johnny4young.secreteo",
    "~/Library/HTTPStorages/com.johnny4young.secreteo",
    "~/Library/Preferences/com.johnny4young.secreteo.plist",
  ]
end

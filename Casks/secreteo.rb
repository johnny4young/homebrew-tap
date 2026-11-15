cask "secreteo" do
  version "0.1.2"
  sha256 "a34722268cad84bce12ea365cd87854a83cd67e5e51b04bce9eaf18b429a25c4"

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

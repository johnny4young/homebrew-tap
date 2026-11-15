cask "secreteo" do
  version "1.0.0"
  sha256 "9dd098ced8275ba2f649f4a9c1c31084f2ee3bf61f78fe3df2ece74cc18191d3"

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

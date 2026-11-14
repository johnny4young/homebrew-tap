cask "secreteo" do
  version "0.1.1"
  sha256 "d3035542fb06f3f4ba28ae2368ec1d0aad2ad005e0a6e5b80fb3ff2f0205e718"

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

cask "secreteo" do
  version "1.2.1"
  sha256 "e4f4a5f56e8a782c7c56b374c3ea619eae0ca10948bb41110c0e1d3a47373afb"

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

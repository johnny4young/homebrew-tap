cask "vitrine" do
  version "0.4.0"
  sha256 "c729c07e560f582b2b45c17e6d9e188391832db50e5c0163faae6881c79c482e"

  url "https://github.com/johnny4young/vitrine/releases/download/v#{version}/Vitrine-#{version}.dmg"
  name "Vitrine"
  desc "Menu-bar app that turns code into beautiful images"
  homepage "https://github.com/johnny4young/vitrine"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Vitrine.app"

  zap trash: [
    "~/Library/Application Support/Vitrine",
    "~/Library/Caches/com.johnny4young.vitrine",
    "~/Library/HTTPStorages/com.johnny4young.vitrine",
    "~/Library/Preferences/com.johnny4young.vitrine.plist",
  ]
end

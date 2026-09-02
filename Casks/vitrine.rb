cask "vitrine" do
  version "1.2.1"
  sha256 "3cd713391b87f3408390a5ec5da3021a7b0cc528c5922093d4fcaea87600ee9f"

  url "https://github.com/johnny4young/vitrine/releases/download/v#{version}/Vitrine-#{version}.dmg"
  name "Vitrine"
  desc "Menu-bar app for polished terminal and code captures"
  homepage "https://vitrineframe.app/"

  # A stable release-URL pattern exists (GitHub release tags), so livecheck can
  # track new versions straight from the releases page.
  livecheck do
    url :url
    strategy :github_latest
  end

  # Sparkle keeps the installed app current in place, so Homebrew
  # should not flag user-updated copies as outdated.
  auto_updates true
  depends_on macos: :sequoia

  app "Vitrine.app"
  # The `vitrine` command-line renderer ships embedded in the app bundle;
  # this symlinks it onto PATH so a cask install gets the CLI too.
  # It is named `vitrine-cli` inside the bundle (a `vitrine` sibling would
  # collide with the `Vitrine` app executable on case-insensitive APFS) and
  # surfaces on PATH under its real name via `target:`.
  binary "#{appdir}/Vitrine.app/Contents/MacOS/vitrine-cli", target: "vitrine"

  zap trash: [
    "~/Library/Application Support/Vitrine",
    "~/Library/Caches/com.johnny4young.vitrine",
    "~/Library/HTTPStorages/com.johnny4young.vitrine",
    "~/Library/Preferences/com.johnny4young.vitrine.plist",
  ]
end

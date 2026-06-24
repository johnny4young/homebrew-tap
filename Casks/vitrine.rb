cask "vitrine" do
  version "0.13.0"
  sha256 "e89ad168e6773378dfd0b8a92560be3b7d299874fdb7473b00774423ac53710c"

  url "https://github.com/johnny4young/vitrine/releases/download/v#{version}/Vitrine-#{version}.dmg"
  name "Vitrine"
  desc "Menu-bar app that turns code into beautiful images"
  homepage "https://github.com/johnny4young/vitrine"

  # A stable release-URL pattern exists (GitHub release tags), so livecheck can
  # track new versions straight from the releases page (CS-063).
  livecheck do
    url :url
    strategy :github_latest
  end

  # Sparkle keeps the installed app current in place (CS-064), so Homebrew
  # should not flag user-updated copies as outdated.
  auto_updates true
  depends_on macos: :sonoma

  app "Vitrine.app"
  # The `vitrine` command-line renderer ships embedded in the app bundle
  # (CS-033); this symlinks it onto PATH so a cask install gets the CLI too.
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

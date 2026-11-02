cask "portavoz" do
  version "1.3.0"
  sha256 "7f01a5258d80748874a09bd1038d3e033145c912bb89821bff7b665965f6da07"

  url "https://github.com/johnny4young/portavoz/releases/download/v#{version}/Portavoz-#{version}.dmg"
  name "Portavoz"
  desc "Privacy-first meeting assistant — knows who said what, locally"
  homepage "https://portavoz.app"

  # Stable GitHub release-tag URLs, so livecheck tracks new versions from the
  # releases page.
  livecheck do
    url :url
    strategy :github_latest
  end

  # Portavoz keeps itself current in place via Sparkle (direct-download
  # channel), so Homebrew should not flag user-updated copies as outdated.
  auto_updates true
  depends_on macos: :tahoe

  app "Portavoz.app"
  # The command-line tool and MCP server ship inside the app (D582).
  binary "#{appdir}/Portavoz.app/Contents/Helpers/portavoz-cli"

  zap trash: [
    "~/Library/Application Support/Portavoz",
  ]

  caveats <<~EOS
    All processing (transcription, diarization, summaries) happens on your Mac.
    The first recording will ask for microphone permission and for
    "Screen & System Audio Recording" permission.
  EOS
end

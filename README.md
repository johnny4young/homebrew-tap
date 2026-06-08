# johnny4young Homebrew Tap

Homebrew casks for Johnny Young's macOS apps.

## Install

```bash
brew tap johnny4young/tap
brew install --cask vitrine
```

You can also install Vitrine without tapping first:

```bash
brew install --cask johnny4young/tap/vitrine
```

## Available casks

| Cask | Version | Description | Upstream |
| --- | --- | --- | --- |
| `vitrine` | `0.1.0` | Native macOS menu-bar app that turns code into beautiful, share-ready images. | <https://github.com/johnny4young/vitrine> |

## Requirements

- macOS Sonoma 14 or newer.
- Homebrew with Cask support.

## Updating

```bash
brew update
brew upgrade --cask vitrine
```

Vitrine also includes Sparkle auto-updates for direct-download installs, so the cask is marked `auto_updates true`. Homebrew can still install or upgrade the published DMG explicitly.

## Verifying the published artifact

The `vitrine` cask points at the signed and notarized GitHub Release DMG:

- Release: <https://github.com/johnny4young/vitrine/releases/tag/v0.1.0>
- DMG: `Vitrine-0.1.0.dmg`
- SHA-256: `8524b7c5071b87bc2666b0ac046d26a59e9f1f8eb1ecebe97bfbd039258a51b8`

Homebrew verifies the checksum before installing.

## Maintainers

Release/bump instructions live in [docs/RELEASING.md](docs/RELEASING.md).

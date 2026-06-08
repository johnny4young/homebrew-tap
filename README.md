# johnny4young's Homebrew Tap

Homebrew casks for my macOS apps.

```bash
brew tap johnny4young/tap
brew install --cask vitrine
```

## Apps

### Vitrine

A native macOS menu-bar app that turns code into beautiful, share-ready images —
local, instant, and private. <https://github.com/johnny4young/vitrine>

```bash
brew install --cask johnny4young/tap/vitrine
```

> The `vitrine` cask is published here with the first tagged release (`v0.1.0`). The
> release workflow prints the DMG's `sha256`, which is set in `Casks/vitrine.rb` at
> that point. Until then the cask is intentionally absent — publishing it with a
> placeholder checksum would break `brew install`.

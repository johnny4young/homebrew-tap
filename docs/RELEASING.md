# Releasing casks in this tap

This tap publishes Homebrew casks for apps owned by `johnny4young`.

## Vitrine

Vitrine releases are produced by the upstream repository:

- Repository: <https://github.com/johnny4young/vitrine>
- Current release: <https://github.com/johnny4young/vitrine/releases/tag/v0.1.0>
- Current cask: [`Casks/vitrine.rb`](../Casks/vitrine.rb)

The upstream release workflow publishes four assets:

- `Vitrine-<version>.dmg`
- `Vitrine-<version>.dmg.sha256`
- `appcast.xml`
- `vitrine-cask-update.txt`

`vitrine-cask-update.txt` is the source of truth for the Homebrew bump. For v0.1.0 it contains:

```ruby
version "0.1.0"
sha256 "8524b7c5071b87bc2666b0ac046d26a59e9f1f8eb1ecebe97bfbd039258a51b8"
```

## Bump procedure

1. Confirm the upstream GitHub Release succeeded and is not a draft.
2. Download or read `vitrine-cask-update.txt` from the release.
3. Update `version` and `sha256` in `Casks/vitrine.rb`.
4. Keep the URL pattern as:

   ```ruby
   url "https://github.com/johnny4young/vitrine/releases/download/v#{version}/Vitrine-#{version}.dmg"
   ```

5. Validate locally:

   ```bash
   brew audit --cask --strict ./Casks/vitrine.rb
   brew install --cask --dry-run ./Casks/vitrine.rb
   brew livecheck --cask ./Casks/vitrine.rb
   ```

6. Commit with an imperative Conventional Commit subject, for example:

   ```bash
   git commit -m "feat(vitrine): publish cask v0.1.0"
   ```

## Current Vitrine metadata

| Field | Value |
| --- | --- |
| Version | `0.1.0` |
| SHA-256 | `8524b7c5071b87bc2666b0ac046d26a59e9f1f8eb1ecebe97bfbd039258a51b8` |
| Minimum macOS | Sonoma 14 (`:sonoma`) |
| Auto-updates | `true` (Sparkle direct-download channel) |

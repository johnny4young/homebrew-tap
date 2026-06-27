# Releasing casks in this tap

This tap publishes Homebrew casks and formulae for projects owned by
`johnny4young`.

## README stays in sync automatically

The version tables in [`README.md`](../README.md) are **generated**, not edited
by hand. The `.rb` files under `Casks/` and `Formula/` are the single source of
truth for each artifact's name, version, description and homepage.

On every push that touches `Casks/**` or `Formula/**` — including the direct
pushes the upstream repos make over their deploy keys — the
[`Sync README tables`](../.github/workflows/sync-readme.yml) workflow runs
[`scripts/sync-readme.py`](../scripts/sync-readme.py) and commits the refreshed
README back. Adding a brand-new cask or formula needs no README edit: drop the
`.rb` in and it shows up in the right table on the next push.

To preview or fix the README locally:

```bash
python3 scripts/sync-readme.py          # rewrite the tables in place
python3 scripts/sync-readme.py --check  # CI-style check: fail if out of date
```

Only the regions between the `<!-- BEGIN:casks -->` / `<!-- BEGIN:formulae -->`
markers are managed by the script; the surrounding prose is hand-written.

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

## Gancho

Gancho releases are produced by the upstream repository:

- Repository: <https://github.com/johnny4young/gancho>
- Current cask: [`Casks/gancho.rb`](../Casks/gancho.rb)

Upstream `make package-dmg` builds the signed, notarized DMG and writes
`dist/gancho-cask-update.txt`, the source of truth for the bump. Upload these
assets to the GitHub Release:

- `Gancho-<version>.dmg`
- `Gancho-<version>.dmg.sha256`
- `appcast.xml` (Sparkle feed; also served from Pages)
- `gancho-cask-update.txt`

For v0.1.0 `gancho-cask-update.txt` contains:

```ruby
version "0.1.0"
sha256 "6b4af3b643505d96b463bb3e97668571281c47c231c925af62ec94a2fd92cc7e"
```

Gancho keeps itself current via Sparkle, so its cask is `auto_updates true`. It
requires macOS Tahoe 26 (`depends_on macos: :tahoe`).

## Gos (formula)

`gos` is a **formula** (not a cask): a shell CLI that installs and switches Go
versions, available on macOS and Linux.

- Repository: <https://github.com/johnny4young/gos>
- Current formula: [`Formula/gos.rb`](../Formula/gos.rb)

Unlike the casks above, `gos` bumps **itself** here on every release. Its
upstream `release` workflow runs `scripts/update-homebrew-tap.sh --kind formula`
(vendored verbatim from the same pattern this tap uses), which regenerates `Formula/gos.rb`
from the in-repo template `packaging/Formula/gos.rb` with the released version,
the pinned source tarball URL, and that tarball's `sha256`, then pushes it over
the `TAP_DEPLOY_KEY` deploy key. No manual step is normally required.

`gos` migrated from the standalone `johnny4young/gos` tap; that tap is deprecated
and re-points existing users here via its `tap_migrations.json`.

### Manual fallback

If the upstream push fails (for example the deploy key is unavailable), update
`Formula/gos.rb` by hand from the released tag `vX.Y.Z`:

```bash
TAG=vX.Y.Z
URL="https://github.com/johnny4young/gos/archive/refs/tags/${TAG}.tar.gz"
SHA=$(curl -fsSL "$URL" | shasum -a 256 | cut -d' ' -f1)
# Set version "X.Y.Z", url "$URL", and sha256 "$SHA" in Formula/gos.rb.
brew style ./Formula/gos.rb   # `brew audit` by path is disabled; audit by name once tapped
ruby -c Formula/gos.rb
git commit -m "chore(gos): publish formula ${TAG}"
```

On push, the `Sync README tables` workflow regenerates the README version table
from the updated `Formula/gos.rb`, so no README edit is needed.

## Bump procedure

These steps use Vitrine as the example; substitute the app name, cask file, and
`<app>-cask-update.txt` for any other cask.

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

# RXDK-Docs

Extracted Xbox SDK HTML reference (`xboxsdk/`) for [RXDK-VSCode](https://github.com/Team-Resurgent/RXDK-VSCode) and other RXDK tooling.

The VSIX bundles a gzip tar of this tree as `docs/xboxsdk.tar.gz`; this repository is the canonical source for that archive.

## Layout

| Path | Purpose |
|------|---------|
| `xboxsdk/` | HTML topics, `toc.json`, welcome page |
| `xboxsdk.tar.gz` | Generated bundle (gitignored locally) |

The archive contains a top-level `xboxsdk/` folder — same layout as `docs/xboxsdk.tar.gz` in RXDK-VSCode.

## Build locally

**Windows (PowerShell):**

```powershell
.\scripts\bundle-xboxsdk-docs.ps1
```

**Linux / macOS:**

```bash
tar -czf xboxsdk.tar.gz xboxsdk
```

Requires `xboxsdk/toc.json` and `xboxsdk/xbox_pk_welcome.htm`.

## CI

GitHub Actions workflow [`.github/workflows/build-xboxsdk-archive.yml`](.github/workflows/build-xboxsdk-archive.yml):

- **Every push / PR** — builds `xboxsdk.tar.gz` and uploads a workflow artifact
- **Push to `main`** — also publishes a pre-release (`docs-<run>`) with the archive attached
- **`v*` tags** — publishes a full release with the archive
- **Manual** — *Actions → Build xboxsdk archive → Run workflow* with **Publish release** checked

## Regenerating from CHM

To re-extract from an XDK `.chm` (maintainers), use [RXDK-VSCode `scripts/extract-xboxsdk-chm.ps1`](https://github.com/Team-Resurgent/RXDK-VSCode/blob/main/scripts/extract-xboxsdk-chm.ps1) and copy the output into `xboxsdk/`.

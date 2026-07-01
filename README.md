# RXDK-Docs

In-editor HTML documentation for [RXDK-VSCode](https://github.com/Team-Resurgent/RXDK-VSCode) and other
RXDK tooling. RXDK-VSCode **clones this repository** to `%ProgramData%\RXDK\docs` (like the SDK
libraries) and renders it in a themed doc viewer; the [`VERSION`](VERSION) file tracks the installed
docs version.

## Layout

| Path | Purpose |
|------|---------|
| `xboxsdk/` | Xbox SDK API reference — HTML topics + `toc.json` + welcome page |
| `rxdk/` | RXDK extension documentation — HTML topics + `toc.json` |
| `VERSION` | Docs version string (read by the extension, like the SDK's `VERSION`) |

Each subset has its own `toc.json` (`{ title, defaultPage, toc: [{ name, page, children }] }`) and is
opened by a separate command: **RXDK: Xbox SDK Documentation** (`xboxsdk/`) and **RXDK: Extension
Documentation** (`rxdk/`).

## Delivery

The extension installs the docs by cloning this repo (`git clone --depth 1`) and updates them with a
`git fetch` + `reset --hard` — the same flow the SDK libraries use. Bump `VERSION` when publishing a
meaningful docs change.

- Override the clone URL / ref with the `rxdk.docsGitUrl` / `rxdk.docsGitRef` settings.
- Authoring pages: plain `.htm` with a `<body>`; the viewer extracts the body, strips legacy styling,
  and applies a theme-aware stylesheet. Cross-link between pages with `href="other-page.htm"`.

## Regenerating the Xbox SDK reference from CHM

To re-extract from an XDK `.chm` (maintainers), use [RXDK-VSCode `scripts/extract-xboxsdk-chm.ps1`](https://github.com/Team-Resurgent/RXDK-VSCode/blob/main/scripts/extract-xboxsdk-chm.ps1) and copy the output into `xboxsdk/`.

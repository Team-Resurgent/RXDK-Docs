# RXDK-Docs

<p align="center"><b>In-editor HTML documentation for the RXDK Xbox SDK and its Visual Studio / VS Code extensions</b></p>

<p align="center">
  <a href="https://github.com/Team-Resurgent/RXDK-Docs/blob/main/LICENSE.md"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="License: GPL v3"></a>
  <a href="https://discord.gg/VcdSfajQGK"><img src="https://img.shields.io/badge/chat-on%20discord-7289da.svg?logo=discord" alt="Discord"></a>
</p>

<p align="center">
  <a href="https://ko-fi.com/J3J7L5UMN"><img src="https://ko-fi.com/img/githubbutton_sm.svg" alt="ko-fi"></a>
  <a href="https://www.patreon.com/teamresurgent"><img src="https://img.shields.io/badge/Patreon-F96854?style=for-the-badge&logo=patreon&logoColor=white" alt="Patreon"></a>
</p>

In-editor HTML documentation for [RXDK-VSCode](https://github.com/Team-Resurgent/RXDK-VSCode) and other
RXDK tooling. RXDK-VSCode **clones this repository** to `%ProgramData%\RXDK\docs` (like the SDK
libraries) and renders it in a themed doc viewer; the [`VERSION`](VERSION) file tracks the installed
docs version.

## Layout

| Path | Purpose |
|------|---------|
| `xboxsdk/` | Xbox SDK API reference — HTML topics + `toc.json` + welcome page |
| `rxdk-vscode/` | RXDK **VS Code** extension documentation — HTML topics + `toc.json` |
| `rxdk-vs/` | RXDK **Visual Studio** (2022/2026) extension documentation — HTML topics + `toc.json` |
| `VERSION` | Docs version string (read by the extension, like the SDK's `VERSION`) |

Each subset has its own `toc.json` (`{ title, defaultPage, toc: [{ name, page, children }] }`) and is
opened by a separate command: **RXDK: Xbox SDK Documentation** (`xboxsdk/`) and **RXDK: Extension
Documentation** (`rxdk-vscode/` in VS Code; `rxdk-vs/` is the parallel extension-doc set for the
Visual Studio 2022/2026 extension).

## Delivery

The extension installs the docs by cloning this repo (`git clone --depth 1`) and updates them with a
`git fetch` + `reset --hard` — the same flow the SDK libraries use. Bump `VERSION` when publishing a
meaningful docs change.

- Override the clone URL / ref with the `rxdk.docsGitUrl` / `rxdk.docsGitRef` settings.
- Authoring pages: plain `.htm` with a `<body>`; the viewer extracts the body, strips legacy styling,
  and applies a theme-aware stylesheet. Cross-link between pages with `href="other-page.htm"`.

## Regenerating the Xbox SDK reference from CHM

To re-extract from an XDK `.chm` (maintainers), use [RXDK-VSCode `scripts/extract-xboxsdk-chm.ps1`](https://github.com/Team-Resurgent/RXDK-VSCode/blob/main/scripts/extract-xboxsdk-chm.ps1) and copy the output into `xboxsdk/`.

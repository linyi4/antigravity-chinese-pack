# Antigravity Chinese Pack (Simplified Chinese)

Localizes the Google Antigravity desktop client UI into Simplified Chinese — menus, settings, dialogs, tray, wizard, sign-in page and sidecar panels.

## Features

- **No Node.js required** — the installer reuses Antigravity's own Electron runtime
- **One click install / one click restore** — `app.asar` is backed up before patching
- **Fully offline** — only UI strings are replaced; account, projects and telemetry are untouched
- **Target**: Antigravity Desktop **2.35.x** on Windows

## Install

1. Quit Antigravity completely (including the tray icon)
2. Run `一键汉化.bat`
3. The client restarts with a Chinese UI

## Restore

Run `一键还原英文.bat`.

## After a client update

Antigravity overwrites `app.asar` on every update, which removes the patch. Just run `一键汉化.bat` again.

## Credits

Engine based on [qqxpee/antigravity2-cn](https://github.com/qqxpee/antigravity2-cn) (MIT). This project adds zero-dependency launching, install-path auto-detection, extra dictionary entries and rewritten docs. Released under the MIT license.

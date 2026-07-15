# Build Baseline — 2026-07

Read-only baseline capture. **No source files were modified.** No fixes applied.

## Environment

| Field | Value |
|-------|-------|
| Date | 2026-07-14 |
| Flutter | 3.44.0 • stable • revision 559ffa3f75 (2026-05-15) |
| Engine | fcf463a2242790d1fdcd9d044f533080f5022e18 (rev 4c525dac5e) |
| Dart | 3.12.0 (stable) |
| DevTools | 2.57.0 |
| Host | macOS (darwin 25.5.0), arm64 |
| Package | pdf_render_maintained |

## Results

| Platform | Command | Result | First error line |
|----------|---------|--------|------------------|
| analysis | `flutter analyze` | ✅ pass | — (`No issues found! (ran in 3.0s)`) |
| test | `flutter test` | ✅ pass | — (`All tests passed!`, 1 test) |
| pana | `dart run pana .` | ⚠️ not run | `Could not find package \`pana\` or file \`pana\`` — pana not installed (not a dep, not globally activated) |
| android | `cd example && flutter build apk --debug` | ✅ pass | — (`✓ Built build/app/outputs/flutter-apk/app-debug.apk`) |
| web | `cd example && flutter build web` | ✅ pass | — (`✓ Built build/web`) |
| web-wasm | `cd example && flutter build web --wasm` | ✅ pass | — (`✓ Built build/web`) |
| macos | `cd example && flutter build macos --debug` | ✅ pass | — (`✓ Built .../flutter_pdf_render_example.app`) |
| windows | `cd example && flutter build windows --debug` | ❌ fail | `"build windows" only supported on Windows hosts.` |
| linux | `cd example && flutter build linux --debug` | ❌ fail | `"build linux" only supported on Linux hosts.` |

### Notes on failures

- **windows / linux** — Both failures are **host-platform limitations of the macOS build machine**, not defects in the plugin or example app. Flutter cannot cross-compile Windows/Linux desktop targets from a macOS host. These would need a Windows/Linux host (or CI) to produce a true build result.
- **pana** — Not executed because the `pana` tool is not available (neither a package dependency nor globally activated via `dart pub global activate pana`). Per the repo's "no new dependencies without asking" rule, it was not installed. Rerun after activating pana if a score is needed.

## Non-blocking warnings observed (informational)

These did **not** fail any build but are worth recording for the ground-truth picture:

- **SwiftPM (all builds):** Repeated notice that the plugin's `Package.swift` for `ios` and `macos` is "missing a dependency on FlutterFramework." Emitted on every build invocation; builds still succeeded.
- **Android (apk):** Deprecation warnings — Gradle 8.12.0 (wants ≥ 8.14.0), Android Gradle Plugin 8.9.1 (wants ≥ 8.11.1), Kotlin 2.1.0 (wants ≥ 2.2.20), and a warning that the plugin applies the Kotlin Gradle Plugin (KGP) which will break future Flutter builds unless migrated to Built-in Kotlin.
- **Web:** `index.html:39` Flutter service worker deprecated; `MaterialIcons`/`CupertinoIcons` font-resolution warning; MaterialIcons tree-shaken 99.5%. Wasm dry-run succeeded.
- **macOS:** Xcode "Run Script build phase 'Run Script' will be run during every build" warning (no declared outputs).
- **Dependencies:** `flutter analyze` reported "13 packages have newer versions incompatible with dependency constraints"; the example app reported 21 such packages.

## How to reproduce

Run from the package root unless noted:

```
flutter analyze
flutter test
dart run pana .                                  # requires: dart pub global activate pana
cd example && flutter build apk --debug
cd example && flutter build web
cd example && flutter build web --wasm
cd example && flutter build macos --debug        # macOS host only
cd example && flutter build windows --debug      # Windows host only
cd example && flutter build linux --debug        # Linux host only
```

---

## pana score (appended 2026-07-14)

Tool: `pana 0.23.14` (installed via `dart pub global activate pana`; **not** added to `pubspec.yaml`).
Command: `dart pub global run pana .`

### **Total: 160 / 160 points**

| Section | Score | Notes |
|---------|-------|-------|
| Follow Dart file conventions | 30 / 30 | Valid `pubspec.yaml`, `README.md`, `CHANGELOG.md`; OSI license detected: **MIT** |
| Provide documentation | 20 / 20 | 140 / 187 API elements (74.9 %) documented; package has an example |
| Platform support | 20 / 20 | Supports 6 / 6 platforms: iOS, Android, Web, Windows, macOS, Linux; WASM-ready; Swift PM-ready |
| Pass static analysis | 50 / 50 | No errors, warnings, lints, or formatting issues |
| Support up-to-date dependencies | 40 / 40 | All deps supported at latest; compatible with lower-bound constraints |

### Warnings pana surfaced (did not cost points)

- **Legacy Kotlin configuration** in `android/build.gradle` — plugin applies the Kotlin Gradle Plugin (KGP) / uses `android.kotlinOptions{}`. Pana note: "This Android plugin does not support built-in Kotlin. In the future, this might affect scoring." (matches the APK-build KGP warning above)
- **dartdoc:** 4 unresolved doc references — `[PDFDocument]` (pdf_render.PdfPage), `[dpi]` (PdfPage.render), and two `[0 1]` refs (PdfViewerController.calculatePageMatrix, goToPointInPage). 0 errors.
- Some public symbols missing docs, e.g. `pdf_render`, `pdf_render_maintained`, `PdfDocument.new`, `PdfDocument.dispose`, `PdfPage.new`.

> Note: pana initializes a scratch git repo and reports the remote as `github.com/khokanuzzman/...` (its own typo-free derivation aside, the real remote is `github.com/khokanuzzaman/pdf_render_maintained`). This does not affect the score.

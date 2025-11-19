# pdf_render_maintained_example

This sample demonstrates **both** the new one-line API (`PdfRenderView` / `PdfRenderScreen`) and the classic advanced widgets (`PdfViewer`, `PdfDocumentLoader`, etc.).

## Demos Included

- **1-Line Setup** – tap any of the first tiles to see how `PdfRenderScreen.asset`, `.network`, or `.memory` instantly renders a document.
- **Advanced APIs** – launch the "Controller-driven viewer" tile to inspect the original `PdfViewer.openAsset/openFutureFile` flow with custom gestures, scroll indicator, and manual controller access.

## Running the Example

From the repository root:

```bash
cd example
flutter run -d <device-id>
```

The project requires the same platform setup described in the main README (Flutter 3.0+, platform SDK tooling, and for web the `pdfjs` script tags).

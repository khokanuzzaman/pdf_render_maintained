// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "pdf_render_maintained",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "pdf_render_maintained",
            targets: ["pdf_render_maintained"]
        ),
    ],
    dependencies: [
        // Flutter is provided by the host app; no external SPM dependencies.
    ],
    targets: [
        .target(
            name: "pdf_render_maintained",
            dependencies: [],
            path: "Sources"
        ),
    ]
)

// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "pdf_render_maintained",
    platforms: [
        // Match Flutter minimum iOS target.
        .iOS(.v13)
    ],
    products: [
        // The Flutter tool references the product by the plugin name with
        // underscores replaced by hyphens; the target keeps the underscored name.
        .library(
            name: "pdf-render-maintained",
            targets: ["pdf_render_maintained"]
        ),
    ],
    dependencies: [
        // Required by Flutter's Swift Package Manager integration so the plugin
        // target can `import Flutter` / `import FlutterMacOS`.
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
    ],
    targets: [
        .target(
            name: "pdf_render_maintained",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
            ],
            path: "Sources"
        ),
    ]
)

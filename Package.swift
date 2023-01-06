// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12)
    ],
    products: [
        .library(name: "WireGuardKit", targets: ["WireGuardKit"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardKitGo", "WireGuardKitC"]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .binaryTarget(
            name: "WireGuardKitGo",
            url: "https://github.com/battlmonstr/wireguard-apple/releases/download/1.0.15.11/WireGuardKitGo.xcframework.zip",
            checksum: "54f50b13f145007f94e420205830d3df5cddef4a32ce3eaa0106e4e17906ac29"
        )
    ]
)

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v14)
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
            url: "https://github.com/operasoftware/wireguard-apple/releases/download/1.0.16.1/WireGuardKitGo.xcframework.zip",
            checksum: "7a332aadff000091f68e7a5ab00c7b40a0b2dc9a90c3336a0b4165a99a1b8593"
        )
    ]
)

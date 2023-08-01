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
            url: "https://github.com/battlmonstr/wireguard-apple/releases/download/1.0.15.12/WireGuardKitGo.xcframework.zip",
            checksum: "29051bffb4af1e407ee69039b961a4ce9e73691b84d5a2f834be57720668c1ac"
        )
    ]
)

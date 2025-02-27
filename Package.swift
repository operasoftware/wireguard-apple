// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v15)
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
            url: "https://github.com/operasoftware/wireguard-apple/releases/download/1.0.16.3/WireGuardKitGo.xcframework.zip",
            checksum: "ce71499d16ec668468bb1c53fc10176a26be5341c12157e4026c22e0a2194b1b"
        )
    ]
)

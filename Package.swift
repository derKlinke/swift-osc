// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-osc",
    platforms: [
        .iOS(.v13),
        .macOS(.v12),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "SwiftOSC",
            targets: ["SwiftOSC"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(name: "SwiftOSC", dependencies: ["ysocket"]),
        
        .target(name: "ysocket", dependencies: ["ysocketc"]),
        
        .target(name: "ysocketc"),
        
            .testTarget(name: "SwiftOSC-Tests", dependencies: ["SwiftOSC"])
    ])

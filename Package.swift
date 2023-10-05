// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Ownership",
    products: [
        .library(name: "Ownership", targets: ["Ownership"]),
    ],
    targets: [
        .target(name: "Ownership"),
        .testTarget(name: "OwnershipTests", dependencies: ["Ownership"]),
    ]
)

// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SwiftIDS",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "SwiftIDS", targets: ["SwiftIDS"])
    ],
    dependencies: [
        // Add any external dependencies here
    ],
    targets: [
        .executableTarget(
            name: "SwiftIDS",
            dependencies: []),
        .testTarget(
            name: "SwiftIDSTests",
            dependencies: ["SwiftIDS"]),
    ]
)
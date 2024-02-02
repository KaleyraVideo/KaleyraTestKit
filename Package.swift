// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "KaleyraTestKit",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "KaleyraTestKit", targets: ["KaleyraTestKit"]),
        .library(name: "KaleyraTestHelpers", targets: ["KaleyraTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/nschum/SwiftHamcrest", .upToNextMajor(from: "2.2.4"))
    ],
    targets: [
        .target(name: "KaleyraTestKit", path: "Source", sources: ["Base"]),
        .target(name: "KaleyraTestHelpers", path: "Source", sources: ["Helpers"]),
        .testTarget(
            name: "KaleyraTestKitTests",
            dependencies: ["KaleyraTestKit"],
            path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)

// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "KaleyraTestKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: .kitTarget, targets: [.kitTarget]),
        .library(name: .helpersTarget, targets: [.helpersTarget]),
        .library(name: .matchersTarget, targets: [.matchersTarget]),
        .library(name: .snapshotTarget, targets: [.snapshotTarget])
    ],
    dependencies: [
        .package(url: "https://github.com/nschum/SwiftHamcrest", .upToNextMajor(from: "2.2.4")),
        .package(url: "https://github.com/uber/ios-snapshot-test-case", .upToNextMajor(from: "8.0.0"))
    ],
    targets: [
        .target(name: .kitTarget,
                dependencies: [.helpers],
                path: .sourcePath,
                sources: ["Base"]),
        .target(name: .helpersTarget,
                path: .sourcePath,
                sources: ["Helpers"]),
        .target(name: .matchersTarget,
                dependencies: [.hamcrest],
                path: .sourcePath,
                sources: ["Matchers"]),
        .target(name: .snapshotTarget,
                dependencies: [.iOSSnapshotTestCase],
                path: .sourcePath,
                sources: ["Snapshot"]),
        .testTarget(name: .kitTestsTarget,
                    dependencies: [.testkit, .hamcrest, .matchers],
                    path: .testsPath,
                    sources: ["Helpers"]),
        .testTarget(name: .snapshotTestsTarget,
                    dependencies: [.testkit, .snapshot, .hamcrest, .matchers],
                    path: .testsPath,
                    sources: ["Snapshot"])
    ],
    swiftLanguageVersions: [.v5]
)

private extension String {

    static let sourcePath: String = "Source"
    static let testsPath: String = "Tests"

    static let kitTarget: String = "KaleyraTestKit"
    static let helpersTarget: String = "KaleyraTestHelpers"
    static let matchersTarget: String = "KaleyraTestMatchers"
    static let snapshotTarget: String = "KaleyraSnapshotTest"
    static let kitTestsTarget: String = "KaleyraTestKitTests"
    static let snapshotTestsTarget: String = "KaleyraSnapshotTestUnitTests"
}

private extension Target.Dependency {

    static var testkit: Target.Dependency {
        .targetItem(name: .kitTarget, condition: .when(platforms: [.iOS]))
    }

    static var helpers: Target.Dependency {
        .targetItem(name: .helpersTarget, condition: .when(platforms: [.iOS]))
    }

    static var snapshot: Target.Dependency {
        .targetItem(name: .snapshotTarget, condition: .when(platforms: [.iOS]))
    }

    static var matchers: Target.Dependency {
        .targetItem(name: .matchersTarget, condition: .when(platforms: [.iOS]))
    }

    static var hamcrest: Target.Dependency {
        .product(name: "SwiftHamcrest", package: "SwiftHamcrest", condition: .when(platforms: [.iOS]))
    }

    static var iOSSnapshotTestCase: Target.Dependency {
        .product(name: "iOSSnapshotTestCase", package: "ios-snapshot-test-case", condition: .when(platforms: [.iOS]))
    }
}

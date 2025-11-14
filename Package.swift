// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "2.17.0-SNAPSHOT-11-14--09-28.git-c734275"
let checksum = "5496b78ed9be9c3f27d96c2ebc956db9143771a143284601c48e511ac8e5845c"
let commonVersion: Version = "24.17.0-SNAPSHOT-11-14--09-28.git-c734275"
let releaseType = "snapshots"

let package = Package(
    name: "MapboxSearchNative",
    platforms: [.iOS(.v12), .macOS(.v10_15)],
    products: [
        .library(
            name: "MapboxSearchNative",
            targets: ["MapboxSearchNativeWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mapbox/mapbox-common-ios.git", exact: commonVersion),
    ],
    targets: [
        .target(
            name: "MapboxSearchNativeWrapper",
            dependencies: [.product(name: "MapboxCommon", package: "mapbox-common-ios"), "MapboxSearchNative"]
        ),
        .binaryTarget(
            name: "MapboxSearchNative",
            url: "https://api.mapbox.com/downloads/v2/search-core-sdk/\(releaseType)/ios/packages/\(version)/MapboxCoreSearch.xcframework.zip",
            checksum: checksum
        )
    ]
)

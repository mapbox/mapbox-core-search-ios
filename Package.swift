// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "2.34.1-SNAPSHOT-11-25--08-32.git-e84fafe"
let checksum = "411f28e5281f374e9862d7d0abfdddb466fa9e30078b894aaee9801a2e434afd"
let commonVersion: Version = "24.34.1-SNAPSHOT-11-25--08-32.git-e84fafe"
let releaseType = "snapshots"

let package = Package(
    name: "MapboxCoreSearch",
    platforms: [.iOS(.v12), .macOS(.v10_15)],
    products: [
        .library(
            name: "MapboxCoreSearch",
            targets: ["MapboxCoreSearchWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mapbox/mapbox-common-ios.git", exact: commonVersion),
    ],
    targets: [
        .target(
            name: "MapboxCoreSearchWrapper",
            dependencies: [.product(name: "MapboxCommon", package: "mapbox-common-ios"), "MapboxCoreSearch"]
        ),
        .binaryTarget(
            name: "MapboxCoreSearch",
            url: "https://api.mapbox.com/downloads/v2/search-core-sdk/\(releaseType)/ios/packages/\(version)/MapboxCoreSearch.xcframework.zip",
            checksum: checksum
        )
    ]
)

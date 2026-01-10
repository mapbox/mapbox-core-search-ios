// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "2.19.0-SNAPSHOT-01-10--04-31.git-716bfc3"
let checksum = "0470bb42b8cc3c28ba9a9d64ee4c82e4e5a52c6f980543351fe6393ad22681dd"
let commonVersion: Version = "24.19.0-SNAPSHOT-01-10--04-31.git-716bfc3"
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

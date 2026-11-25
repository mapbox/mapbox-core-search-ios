// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "2.37.0-SNAPSHOT-11-25--16-19.git-e2b63d8"
let checksum = "dcde6c16388ee078561314fc0d698693f2a8476966423b0cfeb169d4657bd6bb"
let commonVersion: Version = "24.37.0-SNAPSHOT-11-25--16-19.git-e2b63d8"
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

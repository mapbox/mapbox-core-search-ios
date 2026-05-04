// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "2.24.0-alpha.6"
let checksum = "79c044e86f1d2c55e1eba362c8e9b3e6b5f1deb24048889d93dbf5089c9a01ef"
let commonVersion: Version = "24.24.0-alpha.6"
let releaseType = "releases"

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

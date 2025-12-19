// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "2.18.0-SNAPSHOT-12-19--04-31.git-d23d529"
let checksum = "f22000fd0abfd383465d1e1f9da6b66cae7a22d20cf4745db6924af055fa8fac"
let commonVersion: Version = "24.18.0-SNAPSHOT-12-19--04-31.git-d23d529"
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

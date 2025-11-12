// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "2.17.0-beta.1"
let checksum = "e0275e121474443056d39bcc2a8a7a70688bc5e6f7fcec731733d263e6f81d32"
let commonVersion: Version = "24.17.0-beta.1"
let releaseType = "releases"

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

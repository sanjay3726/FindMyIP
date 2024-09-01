// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FindMyIP",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FindMyIP",
            targets: ["FindMyIP"]),
    ],
    dependencies: [
           // Add Alamofire as a dependency
           .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.4")
       ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FindMyIP",
            dependencies: [
                "Alamofire" // Add Alamofire as a target dependency
            ]),
        .testTarget(
            name: "FindMyIPTests",
            dependencies: ["FindMyIP"]),
    ]
)

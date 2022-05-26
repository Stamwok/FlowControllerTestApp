// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginPackage",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LoginPackage",
            targets: ["LoginPackage"]),
    ],
    dependencies: [
        .package(
            name: "AuthorizationPackage",
            path: "../AuthorizationPackage"),
        .package(name: "ModelPackage", path: "../ModelPackage")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LoginPackage",
            dependencies: ["AuthorizationPackage", "ModelPackage"]),
        .testTarget(
            name: "LoginPackageTests",
            dependencies: ["LoginPackage"]),
    ]
)

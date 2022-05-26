// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CabinetPackage",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CabinetPackage",
            targets: ["CabinetPackage"]),
    ],
    dependencies: [
        
        .package(
            name: "LogoutPackage",
            path: "../LogoutPackage"),
        .package(
            name: "LoginPackage",
            path: "../LoginPackage"),
        .package(name: "ModelPackage", path: "../ModelPackage")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CabinetPackage",
            dependencies: ["LogoutPackage", "LoginPackage", "ModelPackage"]),
        .testTarget(
            name: "CabinetPackageTests",
            dependencies: ["CabinetPackage"]),
        
        
//        .testTarget(
//            name: "LoginPackageTests",
//            dependencies: ["LoginPackage"],
//            path: "/Users/lungful/Projects/FlowControllerTestApp/LoginPackage/Sources/LoginPackageTests")
    ]
)

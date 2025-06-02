// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXGAM",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXGAM",
			targets: ["GXGAMWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "3.2.0-rc.9")
	],
	targets: [
		.target(name: "GXGAMWrapper",
				dependencies: [
					"GXGAM",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAM",
			url: "https://pkgs.genexus.dev/iOS/preview/GXGAM-3.2.0-rc.9.xcframework.zip",
			checksum: "b8243e0a13a17691af7d77bf1d5c57c361352ba3ec4b6316bf1238a84a0052c3"
		)
	]
)
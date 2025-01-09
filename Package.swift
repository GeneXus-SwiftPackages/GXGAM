// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXGAM",
	platforms: [.iOS("13.0"), .watchOS("9.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXGAM",
			targets: ["GXGAMWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "3.0.0-rc.2")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXGAM-3.0.0-rc.2.xcframework.zip",
			checksum: "e6f6cb5636b48eac34372e4f526741350f33bfc3ab518f6679ac535dbafc16af"
		)
	]
)
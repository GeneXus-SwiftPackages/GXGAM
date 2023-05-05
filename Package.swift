// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXGAM",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXGAM",
			targets: ["GXGAMWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", branch: "beta")
	],
	targets: [
		.target(name: "GXGAMWrapper",
				dependencies: [
					"GXGAM",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.tvOS, .watchOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAM",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAM-1.0.0-beta+20230505132240.xcframework.zip",
			checksum: "f8adda7036ff3e147b48238ae26acd34e19d6a30988d8f827053c59fb2458916"
		)
	]
)
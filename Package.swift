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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.4.0-beta.2")
	],
	targets: [
		.target(name: "GXGAMWrapper",
				dependencies: [
					"GXGAM",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAM",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAM-1.4.0-beta.2.xcframework.zip",
			checksum: "a3d894d8fc8acabff656fae2f75a126c835a71f6976c02654d2110679526ca91"
		)
	]
)
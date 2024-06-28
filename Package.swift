// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXGAM",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXGAM",
			targets: ["GXGAMWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "2.1.0-rc.25")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXGAM-2.1.0-rc.25.xcframework.zip",
			checksum: "cf5c52dac8045d286cc0f4fab18aebbbf25a2312973603c130c54a6904b34a9b"
		)
	]
)
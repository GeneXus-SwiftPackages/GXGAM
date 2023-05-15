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
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .tvOS, .watchOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAM",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAM-1.0.0-beta+20230515153434.xcframework.zip",
			checksum: "0dac8ed397ec48ecaa80c90c9746483e4640e08ce86d492bb43ea9f315ad2205"
		)
	]
)
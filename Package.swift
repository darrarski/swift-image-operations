// swift-tools-version:5.4
import PackageDescription

let package = Package(
  name: "swift-image-operations",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(
      name: "ImageOperations",
      targets: [
        "ImageOperations",
      ]
    ),
  ],
  dependencies: [
    .package(
      name: "swift-custom-dump",
      url: "https://github.com/pointfreeco/swift-custom-dump.git",
      .upToNextMajor(from: "0.1.2")
    ),
    .package(
      name: "SnapshotTesting",
      url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
      .upToNextMajor(from: "1.9.0")
    ),
  ],
  targets: [
    .target(
      name: "ImageOperations"
    ),
    .testTarget(
      name: "ImageOperationsTests",
      dependencies: [
        .target(
          name: "ImageOperations"
        ),
        .product(
          name: "CustomDump",
          package: "swift-custom-dump"
        ),
        .product(
          name: "SnapshotTesting",
          package: "SnapshotTesting"
        ),
      ],
      exclude: [
        "__Snapshots__",
      ]
    ),
  ]
)

import SnapshotTesting
import XCTest
@testable import ImageOperations

final class CropImageToRectTests: XCTestCase {
  func testCroppingImageToRect() {
    let croppingRect = CGRect(x: 10, y: 20, width: 30, height: 40).insetBy(dx: -5, dy: -5)

    assertSnapshot(
      matching: testImage(.up),
      as: .image(precision: 1, scale: 1),
      named: "up"
    )
    assertSnapshot(
      matching: crop(testImage(.up), to: croppingRect)!,
      as: .image(precision: 1, scale: 1),
      named: "up cropped"
    )
    assertSnapshot(
      matching: testImage(.upMirrored),
      as: .image(precision: 1, scale: 1),
      named: "upMirrored"
    )
    assertSnapshot(
      matching: crop(testImage(.upMirrored), to: croppingRect)!,
      as: .image(precision: 1, scale: 1),
      named: "upMirrored cropped"
    )
    assertSnapshot(
      matching: testImage(.down),
      as: .image(precision: 1, scale: 1),
      named: "down"
    )
    assertSnapshot(
      matching: crop(testImage(.down), to: croppingRect)!,
      as: .image(precision: 1, scale: 1),
      named: "down cropped"
    )
    assertSnapshot(
      matching: testImage(.downMirrored),
      as: .image(precision: 1, scale: 1),
      named: "downMirrored"
    )
    assertSnapshot(
      matching: crop(testImage(.downMirrored), to: croppingRect)!,
      as: .image(precision: 1, scale: 1),
      named: "downMirrored cropped"
    )
    assertSnapshot(
      matching: testImage(.left),
      as: .image(precision: 1, scale: 1),
      named: "left"
    )
    assertSnapshot(
      matching: crop(testImage(.left), to: croppingRect)!,
      as: .image(precision: 1, scale: 1),
      named: "left cropped"
    )
    assertSnapshot(
      matching: testImage(.leftMirrored),
      as: .image(precision: 1, scale: 1),
      named: "leftMirrored"
    )
    assertSnapshot(
      matching: crop(testImage(.leftMirrored), to: croppingRect)!,
      as: .image(precision: 1, scale: 1),
      named: "leftMirrored cropped"
    )
    assertSnapshot(
      matching: testImage(.right),
      as: .image(precision: 1, scale: 1),
      named: "right"
    )
    assertSnapshot(
      matching: crop(testImage(.right), to: croppingRect)!,
      as: .image(precision: 1, scale: 1),
      named: "right cropped"
    )
    assertSnapshot(
      matching: testImage(.rightMirrored),
      as: .image(precision: 1, scale: 1),
      named: "rightMirrored"
    )
    assertSnapshot(
      matching: crop(testImage(.rightMirrored), to: croppingRect)!,
      as: .image(precision: 1, scale: 1),
      named: "rightMirrored cropped"
    )
  }
}

private func testImage(_ imageOrientation: UIImage.Orientation) -> UIImage {
  let imageSize: CGSize
  let rect: CGRect

  switch imageOrientation {
  case .up:
    imageSize = .init(width: 90, height: 130)
    rect = .init(x: 10, y: 20, width: 30, height: 40)
  case .upMirrored:
    imageSize = .init(width: 90, height: 130)
    rect = .init(x: 50, y: 20, width: 30, height: 40)
  case .down:
    imageSize = .init(width: 90, height: 130)
    rect = .init(x: 50, y: 70, width: 30, height: 40)
  case .downMirrored:
    imageSize = .init(width: 90, height: 130)
    rect = .init(x: 10, y: 70, width: 30, height: 40)
  case .left:
    imageSize = .init(width: 130, height: 90)
    rect = .init(x: 70, y: 10, width: 40, height: 30)
  case .leftMirrored:
    imageSize = .init(width: 130, height: 90)
    rect = .init(x: 20, y: 10, width: 40, height: 30)
  case .right:
    imageSize = .init(width: 130, height: 90)
    rect = .init(x: 20, y: 50, width: 40, height: 30)
  case .rightMirrored:
    imageSize = .init(width: 130, height: 90)
    rect = .init(x: 70, y: 50, width: 40, height: 30)
  @unknown default:
    fatalError()
  }

  let bounds = CGRect(origin: .zero, size: imageSize)
  let format = UIGraphicsImageRendererFormat()
  format.scale = 1
  format.opaque = true
  let renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
  let image = renderer.image { rendererContext in
    let cgContext = rendererContext.cgContext
    cgContext.setFillColor(UIColor.gray.cgColor)
    cgContext.fill(bounds)
    cgContext.setFillColor(UIColor.blue.cgColor)
    cgContext.fill(rect)
  }
  return UIImage(
    cgImage: image.cgImage!,
    scale: format.scale,
    orientation: imageOrientation
  )
}

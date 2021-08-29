import SnapshotTesting
import XCTest
@testable import ImageOperations

final class CropImageToAspectRatio: XCTestCase {
  func testCroppingImageToAspectRatio() {
    assertSnapshot(
      matching: crop(
        testImage(size: CGSize(width: 160, height: 90)),
        toAspectRatio: CGSize(width: 4, height: 3)
      )!,
      as: .image(precision: 1, scale: 1)
    )

    assertSnapshot(
      matching: crop(
        testImage(size: CGSize(width: 40, height: 30)),
        toAspectRatio: CGSize(width: 16, height: 9)
      )!,
      as: .image(precision: 1, scale: 1)
    )
  }
}

private func testImage(size: CGSize) -> UIImage {
  let bounds = CGRect(origin: .zero, size: size)
  let format = UIGraphicsImageRendererFormat()
  format.scale = 1
  format.opaque = true
  let renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
  let image = renderer.image { rendererContext in
    let cgContext = rendererContext.cgContext
    cgContext.setFillColor(UIColor.gray.cgColor)
    cgContext.fill(bounds)
    cgContext.addLines(between: [
      CGPoint(x: bounds.minX, y: bounds.minY),
      CGPoint(x: bounds.maxX, y: bounds.maxY)
    ])
    cgContext.addLines(between: [
      CGPoint(x: bounds.minX, y: bounds.maxY),
      CGPoint(x: bounds.maxX, y: bounds.minY)
    ])
    cgContext.setStrokeColor(UIColor.red.cgColor)
    cgContext.setLineWidth(2)
    cgContext.strokePath()
  }
  return UIImage(
    cgImage: image.cgImage!,
    scale: format.scale,
    orientation: .up
  )
}

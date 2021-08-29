import UIKit

/// Crop UIImage to provided rect
/// - Parameters:
///   - image: Image that should be cropped
///   - rect: Rectangle in image after translating it to its image orientation
/// - Returns: Cropped image or `nil` if the provided image is not baked by `CGImage` or `CGImage` can't be cropped
public func crop(
  _ image: UIImage,
  to rect: CGRect
) -> UIImage? {
  let croppingRect = convert(
    rect,
    toViewportOfSize: image.size,
    rotatedBy: image.imageOrientation.rotationAngle,
    mirrored: image.imageOrientation.isMirrored
  )
  .scaled(to: image.scale)
  .roundingValues()

  guard let cgImage = image.cgImage?.cropping(to: croppingRect) else {
    return nil
  }

  return UIImage(
    cgImage: cgImage,
    scale: image.scale,
    orientation: image.imageOrientation
  )
}

private extension UIImage.Orientation {
  var rotationAngle: CGFloat {
    switch self {
    case .down, .downMirrored:
      return .pi
    case .left, .leftMirrored:
      return .pi / 2
    case .right, .rightMirrored:
      return .pi / -2
    case .up, .upMirrored:
      return 0
    @unknown default:
      return 0
    }
  }

  var isMirrored: Bool {
    switch self {
    case .upMirrored, .downMirrored, .leftMirrored, .rightMirrored:
      return true
    case .up, .down, .left, .right:
      return false
    @unknown default:
      return false
    }
  }
}

private extension CGRect {
  func scaled(to scale: CGFloat) -> CGRect {
    applying(.init(scaleX: scale, y: scale))
  }

  func roundingValues() -> CGRect {
    let rule = FloatingPointRoundingRule.toNearestOrAwayFromZero
    return CGRect(
      x: origin.x.rounded(rule),
      y: origin.y.rounded(rule),
      width: size.width.rounded(rule),
      height: size.height.rounded(rule)
    )
  }
}

import CoreGraphics

/// Convert rect to viewport.
/// - Parameters:
///   - rect: Rectangle that should be converted
///   - viewportSize: Size of the viewport
///   - rotationAngle: Rotation angle of the viewport
///   - mirror: Is viewport mirrored
/// - Returns: Converted rect
public func convert(
  _ rect: CGRect,
  toViewportOfSize viewportSize: CGSize,
  rotatedBy rotationAngle: CGFloat,
  mirrored mirror: Bool
) -> CGRect {
  let bounds = CGRect(origin: .zero, size: viewportSize)
  let rotation = CGAffineTransform(rotationAngle: rotationAngle)
  let rotatedBounds = bounds.applying(rotation)
  let translation = CGAffineTransform(translationX: -rotatedBounds.minX, y: -rotatedBounds.minY)
  let rotatedRect = rect.applying(rotation).applying(translation)
  guard mirror else { return rotatedRect }
  let translatedBounds = rotatedBounds.applying(translation)
  let mirroredRect = rotatedRect.applying(
    .init(translationX: translatedBounds.midX, y: 0)
      .scaledBy(x: -1, y: 1)
      .translatedBy(x: -translatedBounds.midX, y: 0)
  )
  return mirroredRect
}

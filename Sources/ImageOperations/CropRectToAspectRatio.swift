import CoreGraphics
import AVFoundation

/// Crop rect to provided aspect ratio
/// - Parameters:
///   - rect: Rectangle that should be cropped
///   - aspectRatio: Aspect ratio of the returned rectangle
/// - Returns: Rectangle cropped to provided aspect ratio
public func crop(_ rect: CGRect, toAspectRatio aspectRatio: CGSize) -> CGRect {
  AVMakeRect(aspectRatio: aspectRatio, insideRect: rect)
}

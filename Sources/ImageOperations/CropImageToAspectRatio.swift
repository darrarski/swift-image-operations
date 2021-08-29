import UIKit

/// Crop image so it fits provided aspect ratio
/// - Parameters:
///   - image: Image that shuld be cropped
///   - aspectRatio: Aspect ratio of the returned image
/// - Returns: Cropped image
public func crop(
  _ image: UIImage,
  toAspectRatio aspectRatio: CGSize
) -> UIImage? {
  let croppingRect = crop(
    CGRect(origin: .zero, size: image.size),
    toAspectRatio: aspectRatio
  )
  return crop(image, to: croppingRect)
}

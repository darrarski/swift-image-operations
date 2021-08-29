import CustomDump
import XCTest
@testable import ImageOperations

final class CropRectToAspectRatioTests: XCTestCase {
  func testCroppingRectToAspectRatio() {
    XCTAssertNoDifference(
      crop(
        CGRect(x: 0, y: 0, width: 16, height: 9),
        toAspectRatio: CGSize(width: 4, height: 3)
      ),
      CGRect(x: 2, y: 0, width: 12, height: 9)
    )

    XCTAssertNoDifference(
      crop(
        CGRect(x: 2, y: 0, width: 12, height: 9),
        toAspectRatio: CGSize(width: 16, height: 9)
      ),
      CGRect(x: 2, y: 1.125, width: 12, height: 6.75)
    )
  }
}

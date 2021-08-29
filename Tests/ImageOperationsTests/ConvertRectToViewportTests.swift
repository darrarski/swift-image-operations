import CustomDump
import XCTest
@testable import ImageOperations

final class ConvertRectToViewportTests: XCTestCase {
  func testConvertingRectToViewport() {
    let rect = CGRect(x: 1, y: 2, width: 3, height: 4)
    let viewportSize = CGSize(width: 9, height: 13)

    XCTAssertNoDifference(
      convert(
        rect,
        toViewportOfSize: viewportSize,
        rotatedBy: 0,
        mirrored: false
      ).roundingValues(),
      rect
    )

    XCTAssertNoDifference(
      convert(
        rect,
        toViewportOfSize: viewportSize,
        rotatedBy: 0,
        mirrored: true
      ).roundingValues(),
      CGRect(x: 5, y: 2, width: 3, height: 4)
    )

    XCTAssertNoDifference(
      convert(
        rect,
        toViewportOfSize: viewportSize,
        rotatedBy: .pi,
        mirrored: false
      ).roundingValues(),
      CGRect(x: 5, y: 7, width: 3, height: 4)
    )

    XCTAssertNoDifference(
      convert(
        rect,
        toViewportOfSize: viewportSize,
        rotatedBy: .pi,
        mirrored: true
      ).roundingValues(),
      CGRect(x: 1, y: 7, width: 3, height: 4)
    )

    XCTAssertNoDifference(
      convert(
        rect,
        toViewportOfSize: viewportSize,
        rotatedBy: .pi / 2,
        mirrored: false
      ).roundingValues(),
      CGRect(x: 7, y: 1, width: 4, height: 3)
    )

    XCTAssertNoDifference(
      convert(
        rect,
        toViewportOfSize: viewportSize,
        rotatedBy: .pi / 2,
        mirrored: true
      ).roundingValues(),
      CGRect(x: 2, y: 1, width: 4, height: 3)
    )

    XCTAssertNoDifference(
      convert(
        rect,
        toViewportOfSize: viewportSize,
        rotatedBy: .pi / -2,
        mirrored: false
      ).roundingValues(),
      CGRect(x: 2, y: 5, width: 4, height: 3)
    )

    XCTAssertNoDifference(
      convert(
        rect,
        toViewportOfSize: viewportSize,
        rotatedBy: .pi / -2,
        mirrored: true
      ).roundingValues(),
      CGRect(x: 7, y: 5, width: 4, height: 3)
    )
  }
}

private extension CGRect {
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

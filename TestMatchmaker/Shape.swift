import Foundation
import CoreGraphics
import UIKit

struct Circle {
    var location: CGPoint
}

extension Circle: Drawable {
    func draw() {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.saveGState()
        ctx?.translateBy(x: location.x, y: location.y)
        ctx?.setStrokeColor(UIColor.green.cgColor)
        ctx?.setLineWidth(10)
        ctx?.addArc(center: CGPoint.zero, radius: 10, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
        ctx?.strokePath()
        ctx?.restoreGState()
    }
}

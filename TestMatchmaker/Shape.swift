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
        ctx?.setStrokeColor(UIColor.green.cgColor)
        ctx?.setLineWidth(10)
        ctx?.addArc(center: location, radius: 10, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
        ctx?.strokePath()
        ctx?.restoreGState()
    }
}

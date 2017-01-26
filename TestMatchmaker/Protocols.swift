import Foundation
import CoreGraphics

protocol GameViewHandler: class {
    func translate(point: CGPoint)
}

protocol Drawable {
    func draw()
}

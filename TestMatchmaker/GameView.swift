import Foundation
import UIKit

class GameView: UIView {
    
    weak var gamehandler: GameViewHandler?
    
    var model: [Drawable] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    init(frame: CGRect, handler: GameViewHandler, firstitem: Drawable) {
        gamehandler = handler
        model = [firstitem]
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for item in touches {
            let point = item.location(in: self)
            gamehandler?.translate(point: point)
        }
    }
    
    override func draw(_ rect: CGRect) {
        for item in model {
            item.draw()
        }
    }
}

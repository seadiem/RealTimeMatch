import UIKit

class GameController: UIViewController {
    
    var gameview: GameView!
    
    var circle: Circle
    
    init() {
        circle = Circle(location: CGPoint.zero)
        super.init(nibName: nil, bundle: nil)
        gameview = GameView(frame: view.frame, handler: self, firstitem: circle)
        gameview.backgroundColor = UIColor.darkGray
        view.addSubview(gameview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameController: GameViewHandler {
    func translate(point: CGPoint) {
        circle.location = point
        gameview.model = [circle]
    }
}

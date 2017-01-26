import UIKit
import GameKit

class GameController: UIViewController {
    
    var match: GKMatch? {
        didSet {
            guard let match = match else { return }
            match.delegate = self
        }
    }
    
    var gameview: GameView!
    
    var circle: Circle
    
    init() {
        circle = Circle(location: CGPoint.zero)
        super.init(nibName: nil, bundle: nil)
        gameview = GameView(frame: view.frame, handler: self, firstitem: circle)
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
        sendToCenter()
    }
}

extension GameController: GKMatchDelegate {
    func match(_ match: GKMatch, didReceive data: Data, forRecipient recipient: GKPlayer, fromRemotePlayer player: GKPlayer) {
        decodeData(data: data)
    }
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        decodeData(data: data)
    }
}

//Encode data
extension GameController {
    func sendToCenter() {
        let modeltoencode = circle
        guard let data = Network.makeDataFromCircle(circle: modeltoencode) else { return }
        guard let match = match else { return }
        do {
            try match.sendData(toAllPlayers: data, with: GKMatchSendDataMode.reliable)
        } catch let error {
            print(error)
        }
    }
}

//Decode data
extension GameController {
    func decodeData(data: Data) {
        guard let circle = Network.makeCircleFromData(data: data) else { return }
        self.circle = circle
        gameview.model = [circle]
    }
}










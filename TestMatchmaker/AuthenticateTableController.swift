import UIKit
import GameKit

class AuthenticateTableController: UITableViewController {
    
    let model = AuthenticateTableModel()
    
    init() {
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        tableView.contentInset.top += 18
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "content")
        showLogin()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = model.sections[section]
        switch section {
        case .content: return model.cells.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = model.sections[indexPath.section]
        switch section {
        case .content:
            let cell = tableView.dequeueReusableCell(withIdentifier: "content", for: indexPath)
            cell.textLabel?.text = model.cells[indexPath.row].text
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = model.cells[indexPath.row]
        switch cell {
        case .one: showMatchmaker()
        case .two: showLogin()
        default: break
        }
    }
    
    func login(vc: UIViewController?, error: Error?) {
        if let vc = vc {
            UIApplication.shared.keyWindow?.rootViewController?.show(vc, sender: self)
        }
    }
    
    func showMatchmaker() {
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 2
        let gamemaker = GKMatchmakerViewController(matchRequest: request)
        gamemaker?.matchmakerDelegate = self
        show(gamemaker!, sender: self)
    }
    
    func showLogin() {
        func getLogin() -> (UIViewController?, Error?) -> () {
            return login
        }
        GKLocalPlayer.localPlayer().authenticateHandler = getLogin()
    }
    
}

extension AuthenticateTableController: GKMatchmakerViewControllerDelegate {
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        presentedViewController?.dismiss(animated: true, completion: nil)
        print(match)
    }
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        presentedViewController?.dismiss(animated: true, completion: nil)
        print(error)
    }
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFindHostedPlayers players: [GKPlayer]) {
        print(players)
    }
}
















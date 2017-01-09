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
        func getLogin() -> (UIViewController?, Error?) -> () {
            return login
        }
        GKLocalPlayer.localPlayer().authenticateHandler = getLogin()
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
        default: break
        }
    }
    
    func login(vc: UIViewController?, error: Error?) {
        if let vc = vc {
            UIApplication.shared.keyWindow?.rootViewController?.show(vc, sender: self)
        }
    }
    
    func showMatchmaker() {
        print("tap")
    }
}
















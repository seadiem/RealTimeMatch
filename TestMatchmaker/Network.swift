import Foundation
import CoreGraphics

struct Network {
    
    static let xpos = "xpos"
    static let ypos = "ypos"
    
    static func makeDataFromCircle(circle: Circle) -> Data? {
        var dict: [String: Any] = [:]
        dict[xpos] = circle.location.x
        dict[ypos] = circle.location.y
        do {
            let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            return data
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
    static func makeCircleFromData(data: Data) -> Circle? {
        do {
            let atributes = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
            guard let x = atributes[xpos] as? CGFloat else { return nil }
            guard let y = atributes[ypos] as? CGFloat else { return nil }
            let point = CGPoint(x: x, y: y)
            let circle = Circle(location: point)
            return circle
        }  catch let error {
            print(error)
            return nil
        }
    }
}

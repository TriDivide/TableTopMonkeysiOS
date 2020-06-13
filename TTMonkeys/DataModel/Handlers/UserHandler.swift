import Foundation

class UserHandler: NSObject {
    let uuid = UUID().uuidString
    
    let callback: (User?, Error?) -> Void
    
    init(callback: @escaping(User?, Error?) -> Void) {
        self.callback = callback
    }
}

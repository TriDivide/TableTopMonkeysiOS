import Foundation

class ProtectedUserHandler: NSObject {
    let uuid = UUID().uuidString
    
    let callback: (ProtectedUser?, Error?) -> Void
    
    init(callback: @escaping(ProtectedUser?, Error?) -> Void) {
        self.callback = callback
    }
}

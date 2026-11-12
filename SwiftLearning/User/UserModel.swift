import Foundation

struct UserModel: Identifiable, Codable {
    let uid: String
    let name: String
    let email: String
    
    var id: String {
        uid
    }
}




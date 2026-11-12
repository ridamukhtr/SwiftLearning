import Foundation 

protocol UserRepository {
    
    func registerUser(
           name: String,
           email: String,
           password: String
    ) async throws -> UserModel
    
    func loginUser(
        email: String,
        password: String
    ) async throws -> UserModel

    func fetchUser(uid: String) async throws -> UserModel
    
    func logout() async throws

}

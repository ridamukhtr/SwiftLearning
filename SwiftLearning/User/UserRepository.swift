
protocol UserRepository {

     func saveUser(user: UserModel) async throws

     func loginUser(email: String, password: String) async throws -> UserModel
}
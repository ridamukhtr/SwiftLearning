import FirebaseAuth
import FirebaseFirestore

final class FirebaseUserRepository: UserRepository {
    private let auth: Auth
    private let db: Firestore
    
    init(auth: Auth, db: Firestore) {
        self.auth = auth
        self.db = db
    }
    
    private var users: CollectionReference {
        db.collection("users")
    }

    func registerUser(
        name: String,
        email: String,
        password: String
    ) async throws -> UserModel {
        let result = try await auth.createUser(withEmail: email, password: password)
        let user = UserModel(uid: result.user.uid, name: name, email: email)
        try users.document(user.uid).setData(from: user)
        return user
        
    }
    
    func loginUser(
        email: String,
        password: String
    ) async throws -> UserModel {
        let result = try await auth.signIn(withEmail: email, password: password)
        return try await fetchUser(uid: result.user.uid)
        
    }

    func fetchUser(uid: String) async throws -> UserModel {
        let snapshot = try await users.document(uid).getDocument()
        return try snapshot.data(as: UserModel.self)
    }
    
    func logout() async throws {
        try auth.signOut()
    }
    
}


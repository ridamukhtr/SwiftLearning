import FirebaseAuth
import FirebaseFirestore

struct AppDependencies {
    let userRepository: any UserRepository

    init() {
        let auth = Auth.auth()
        let db = Firestore.firestore()
        self.userRepository = FirebaseUserRepository(auth: auth, db: db)
    }
}

import FirebaseAuth
import FirebaseFirestore

@MainActor
struct AppDependencies {
    let userRepository: any UserRepository
    let userViewModel: UserViewModel

    init() {
        let auth = Auth.auth()
        let db = Firestore.firestore()
        let repository = FirebaseUserRepository(auth: auth, db: db)
        self.userRepository = repository
        self.userViewModel = UserViewModel(repository: repository)
    }
}


import SwiftUI
import FirebaseCore

@main
struct SwiftLearningApp: App {
    // register app delegate for Firebase setup
    @StateObject private var userViewModel: UserViewModel

    init() {
        FirebaseApp.configure()
        let dependencies = AppDependencies()
        _userViewModel = StateObject(wrappedValue: dependencies.userViewModel)
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserView(viewModel: userViewModel)
            }
        }
    }
}

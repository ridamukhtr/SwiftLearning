import SwiftUI
import FirebaseCore

@main
struct SwiftLearningApp: App {
    @StateObject private var userViewModel: UserViewModel
    @StateObject private var router = AppRouter()

    init() {
        FirebaseApp.configure()
        let dependencies = AppDependencies()
        _userViewModel = StateObject(wrappedValue: dependencies.userViewModel)
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                LoginView(viewModel: userViewModel)
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .register:
                            UserView(viewModel: userViewModel)
                        case .home:
                            HomeView(viewModel: userViewModel)
                        }
                    }
                    .environmentObject(router)
            }
        }
    }
}

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: UserViewModel
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "swift")
                .font(.system(size: 60))
                .foregroundStyle(.orange)
            Text("Hello, SwiftUI!")
                .font(.largeTitle.bold())

            if let user = viewModel.currentUser {
                Text("Signed in as \(user.name)")
            }

            Text("You tapped \(count) times")
                .foregroundStyle(.secondary)
            Button("Tap me") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: UserViewModel(repository: PreviewUserRepository()))
}

#if DEBUG
final class PreviewUserRepository: UserRepository {
    func registerUser(name: String, email: String, password: String) async throws -> UserModel {
        UserModel(uid: "preview", name: name, email: email)
    }
    func loginUser(email: String, password: String) async throws -> UserModel {
        UserModel(uid: "preview", name: "Preview User", email: email)
    }
    func fetchUser(uid: String) async throws -> UserModel {
        UserModel(uid: uid, name: "Preview User", email: "preview@test.com")
    }
    func logout() async throws {}
}
#endif

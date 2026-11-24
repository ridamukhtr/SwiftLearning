import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: UserViewModel
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 60))
                .foregroundStyle(.green)

            Text("You're in!")
                .font(.largeTitle.bold())

            if let user = viewModel.currentUser {
                VStack(spacing: 4) {
                    Text("Hi, \(user.name)")
                        .font(.title2)
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            AppButton(title: "Log out", isLoading: false) {
                Task { await logout() }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }

    private func logout() async {
        await viewModel.logout()
        router.popToRoot()
    }
}

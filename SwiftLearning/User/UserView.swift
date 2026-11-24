import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel: UserViewModel
    @EnvironmentObject var router: AppRouter

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle.bold())

            AppTextField(title: "Full Name", text: $name)
            AppTextField(title: "Email", text: $email, keyboardType: .emailAddress)
            AppTextField(title: "Password", text: $password, isSecure: true)

            AppButton(title: "Register", isLoading: viewModel.isLoading) {
                Task {
                    await viewModel.register(name: name, email: email, password: password)
                    if viewModel.currentUser != nil {
                        router.push(.home)
                    }
                }
            }

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }
        }
        .padding()
    }
}

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: UserViewModel
    @EnvironmentObject var router: AppRouter
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text ("Welcome Back")
                .font(.largeTitle.bold())
            AppTextField(title: "Email", text: $email, keyboardType: .emailAddress)
            AppTextField(title: "Password", text: $password, isSecure: true)
            
            AppButton(title: "Login", isLoading: viewModel.isLoading) {
                Task {
                    await viewModel.login(email: email, password: password)
                    if viewModel.currentUser != nil {
                        router.push(.home)
                    }
                }
            }

            Button("Create account") {
                router.push(.register)
            }

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
                
            }
            if let user = viewModel.currentUser{
                Text("Welcome, \(user.name)!")
                    .foregroundStyle(.green)
            }
        }
        .padding()
    }
}

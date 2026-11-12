
import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel: UserViewModel

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle.bold())

            TextField("Full Name", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button {
                Task {
                    await viewModel.register(
                        name: name,
                        email: email,
                        password: password
                    )
                }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }

            if let user = viewModel.currentUser {
                Text("Welcome, \(user.name)!")
                    .foregroundStyle(.green)
            }
        }
        .padding()
    }
}

import Foundation
import Combine

@MainActor
final class UserViewModel: ObservableObject {
    private let repository: any UserRepository
    
    @Published var currentUser: UserModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(repository: any UserRepository) {
        self.repository = repository
    }
    
    func register(name: String, email: String, password: String) async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
           let user = try await repository.registerUser(
            name: name,
            email: email,
            password: password
           )
            currentUser = user
        } catch {
            errorMessage = error.localizedDescription
        }    }
}

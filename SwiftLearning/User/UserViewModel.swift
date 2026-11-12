import Foundation
import Combine

@MainActor
final class UserViewModel: ObservableObject {
    private let repository: any UserRepository
    
    @Published var currentUser: UserModel?
    
    init(repository: any UserRepository) {
        self.repository = repository
    }
}

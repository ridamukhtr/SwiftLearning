
import SwiftUI

struct AppButton: View {
    let title: String
    var isLoading = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Group {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .buttonStyle(.borderedProminent)
        .disabled(isLoading)
        .padding()
    }
}

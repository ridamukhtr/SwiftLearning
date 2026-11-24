import SwiftUI

struct AppTextField:View {
    
    let title : String
    @Binding var text: String
    var isSecure = false
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        Group {
            if isSecure {
                SecureField(title, text: $text)
                    .padding()
            } else {
                TextField(title, text: $text)
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.never)
                    .padding()
            }
        }
        
        .textFieldStyle(.roundedBorder)
    }
}

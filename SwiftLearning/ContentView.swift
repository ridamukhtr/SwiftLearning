import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "swift")
                .font(.system(size: 60))
                .foregroundStyle(.orange)
            Text("Hello, SwiftUI!")
                .font(.largeTitle.bold())

            Button("Run SOLID demos") {
                SRPExample.demo()
                OCPExample.demo()
                LSPExample.demo()
                ISPExample.demo()
                DIPExample.demo()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

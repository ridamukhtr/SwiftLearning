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
    ContentView()
}

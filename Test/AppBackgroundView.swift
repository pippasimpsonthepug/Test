import SwiftUI

struct AppBackgroundView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Theme.red
                Theme.yellow
                Theme.red
            }
            .ignoresSafeArea()

            content
        }
    }
}

#Preview {
    AppBackgroundView {
        Text("Preview")
    }
}

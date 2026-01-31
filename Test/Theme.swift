import SwiftUI

enum Theme {
    static let red = Color("SpainRed")
    static let yellow = Color("SpainYellow")

    static func font(_ style: Font.TextStyle) -> Font {
        .system(style, design: .rounded)
    }

    @ViewBuilder
    static func card<Content: View>(@ViewBuilder _ content: () -> Content) -> some View {
        content()
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }

    struct PrimaryButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(Theme.font(.headline))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(
                    Theme.red
                        .opacity(configuration.isPressed ? 0.85 : 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

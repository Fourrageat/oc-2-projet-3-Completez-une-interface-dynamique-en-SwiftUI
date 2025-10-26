
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Image("TajMahal")
                    .resizable()
                    .cornerRadius(10)

                HStack() {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Restaurant Indien")
                            .commonFontStyles(12)

                        Text("Taj Mahal")
                            .commonFontStyles(18, Color.appBlack, .bold)
                            .padding(.top, 2)
                    }
                    Spacer()
                    Image("GrayLogo")
                        .frame(width: 40, height: 40)
                }
                .padding(.top, 32)
                VStack(spacing: 14) {
                    KeyValueRow(
                        icon: "Horaire",
                        title: "Mardi",
                        value: "11h30 – 14h30 • 18h30 – 22h00"
                    )
                    KeyValueRow(
                        icon: "Marmite",
                        title: "Type de Service",
                        value: "À emporter"
                    )
                    InfoRow(
                        icon: "Localisation",
                        text: "12 Avenue de la Brique – 75010 Paris"
                    )
                    InfoRow(
                        icon: "Site",
                        text: "www.tajmahal.fr",
                    )
                    InfoRow(
                        icon: "Téléphone",
                        text: "06 12 34 56 78",
                    )
                }
                .padding(.top, 32)
                
                NavigationLink {
                    MenuView()
                } label: {
                    Text("Accéder au menu")
                        .commonFontStyles(16, Color.white, .bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.appRed)
                        .cornerRadius(10)
                }
                .padding(.top, 32)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct KeyValueRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(icon)
            Text(title)
                .commonFontStyles(12)

            Spacer()
            Text(value)
                .commonFontStyles(12)
                .multilineTextAlignment(.trailing)

        }
    }
}

struct InfoRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(icon)
            Text(text)
                .commonFontStyles(12)
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    WelcomeView()
}

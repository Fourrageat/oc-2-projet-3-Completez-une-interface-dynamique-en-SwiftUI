// Vue d'accueil affichant les informations principales du restaurant et permettant d'accéder au menu.

import SwiftUI

// Écran d'accueil du restaurant affichant image, informations et bouton d'accès au menu
struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Image("TajMahal")
                        .resizable()
                        .cornerRadius(10)

                    HStack() {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Restaurant Indien")
                                .foregroundStyle(Color.appGray)
                                .font(Font.DefaultFont(size: 12))

                            Text("Taj Mahal")
                                .foregroundStyle(Color.appBlack)
                                .font(Font.DefaultFont(size: 18))
                                .fontWeight(.bold)
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
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
            }
            // Bouton de navigation vers le menu du restaurant
            NavigationLink {
                MenuView()
            } label: {
                Text("Accéder au menu")
                    .font(Font.DefaultFont(size: 16))
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.appRed)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.top, 18)
        }
    }
}

// Sous-vue affichant une ligne d'information avec une icône, un titre et une valeur
struct KeyValueRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        // Ligne HStack avec l'icône, le titre et la valeur
        HStack(alignment: .center, spacing: 10) {
            Image(icon)
            Text(title)
                .foregroundStyle(Color.appGray)
                .font(Font.DefaultFont(size: 12))

            Spacer()
            Text(value)
                .foregroundStyle(Color.appGray)
                .multilineTextAlignment(.trailing)
                .font(Font.DefaultFont(size: 12))

        }
    }
}

// Sous-vue affichant une ligne d'information simple avec une icône
struct InfoRow: View {
    let icon: String
    let text: String

    var body: some View {
        // Ligne HStack avec l'icône et le texte
        HStack(alignment: .center, spacing: 10) {
            Image(icon)
            Text(text)
                .foregroundStyle(Color.appGray)
                .font(Font.DefaultFont(size: 12))
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    WelcomeView()
}

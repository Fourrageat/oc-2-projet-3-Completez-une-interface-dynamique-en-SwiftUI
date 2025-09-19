import SwiftUI

var grayColor: Color { Color(red: 102/255, green: 102/255, blue: 102/255) }

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Image("TajMahal")
                        .resizable()
                        .cornerRadius(10)

                    HStack() {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Restaurant Indien")
                                .foregroundStyle(grayColor)
                                .font(.system(size: 12))
                            
                            Text("Taj Mahal")
                                .foregroundStyle(.primary)
                                .fontWeight(.bold)
                                .font(.custom("PlusJakartaSans", size: 18))
                        }
                        Spacer()
                        Image("Logo1")
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
            
            NavigationLink {
                MenuView()
            } label: {
                Text("Menu")
            }
        }
    }
}

struct KeyValueRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Symbol(icon)
            Text(title)
                .foregroundStyle(grayColor)
                .font(.system(size: 12))
            Spacer()
            Text(value)
                .foregroundStyle(grayColor)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 12))
        }
    }
}

struct InfoRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Symbol(icon)
            Text(text)
                .foregroundStyle(grayColor)
                .font(.system(size: 12))
            Spacer(minLength: 0)
        }
    }
}

private func Symbol(_ name: String) -> some View {
    Image(name)
}

#Preview {
    WelcomeView()
}


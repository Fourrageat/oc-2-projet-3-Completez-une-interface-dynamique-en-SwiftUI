import SwiftUI

struct WelcomeView: View {

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Image("TajMahal")
                        .resizable()
                        .cornerRadius(16)

                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Restaurant Indien")
                                .foregroundStyle(.secondary)
                                .font(.system(size: 12))
                            
                            Text("Taj Mahal")
                                .foregroundStyle(.primary)
                                .font(.system(size: 18, weight: .bold))
                        }
                        Spacer()
                        Image("Logo1")
                    }
                    .padding(.top, 16)
                    
                    VStack {
                        KeyValueRow(
                            icon: "clock",
                            title: "Mardi",
                            value: "11h30 – 14h30 • 18h30 – 22h00"
                        )
                        KeyValueRow(
                            icon: "",
                            title: "Type de Service",
                            value: "À emporter"
                        )
                        InfoRow(
                            icon: "",
                            text: "12 Avenue de la Brique – 75010 Paris"
                        )
                        InfoRow(
                            icon: "globe",
                            text: "www.tajmahal.fr",
                        )
                        InfoRow(
                            icon: "phone",
                            text: "06 12 34 56 78",
                        )
                    }
                    .padding(.top, 16)
                }
                .padding(.horizontal, 8)
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
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Symbol(icon)
            Text(title)
                .foregroundStyle(.secondary)
                .font(.system(size: 12))
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 12))
        }
        .padding(.vertical, 4)
    }
}

struct InfoRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Symbol(icon)
            Text(text)
                .foregroundStyle(.secondary)
                .font(.system(size: 12))
            Spacer(minLength: 0)
        }
        .padding(.vertical, 4)
    }
}

private func Symbol(_ name: String) -> some View {
    Image(systemName: name)
        .foregroundStyle(.secondary)
        .font(.system(size: 12))
}

#Preview {
    WelcomeView()
}

//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Écran du menu : présente les entrées et plats principaux
struct MenuView: View {
    let apetizerArray = ViewModel().apetizerArray
    let mainCourseArray = ViewModel().mainCourseArray

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    Text("Entrées")
                        .commonFontStyles(14.0, .bold)
                    RowDishView(dishes: apetizerArray) // Affiche la liste des entrées
                    
                    Text("Plats Principaux")
                        .commonFontStyles(14.0, .bold)
                        .padding(.top, 12)
                    RowDishView(dishes: mainCourseArray) // Affiche la liste des plats principaux
                }
                .padding(.horizontal, 20)
                // Ajuste l’espace supérieur en fonction des changements
                // de mise en page introduits sur iOS 26.
                .padding(.top, {
                    if #available(iOS 26.0, *) {
                        return 6.0
                    } else {
                        return 12.0
                    }
                }())
            }
            .background(Color.backgroundMenuScreenView)
        }
        .customNavigationBar()
        // Barre d’outils adaptée selon la version d’iOS : sur iOS 26+,
        // on utilise la nouvelle API (sharedBackgroundVisibility et item),
        // sinon on garde le placement classique.
        .toolbar {
            if #available(iOS 26.0, *) {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.appBlack)
                            .padding(.leading, -20)
                    }
                }
                .sharedBackgroundVisibility(.hidden)
                ToolbarItem(placement: .principal) {
                    Text("Menu")
                        .commonFontStyles(18.0, Color.appBlack, .bold)
                }
            } else {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.appBlack)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Menu")
                        .commonFontStyles(18.0, Color.appBlack, .bold)
                }
            }
        }
    }
}

// Affiche ligne par ligne les plats donnés en paramètre
struct RowDishView: View {
    let dishes: [Dish]
    
    var body: some View {
        if dishes.isEmpty {
            Text("Aucun plat trouvé.")
        } else {
            ForEach(dishes, id: \.name) { dish in
                NavigationLink {
                    // Navigation vers la page de details du plat (dish) de la boucle
                    // MenuDetailsView attends un paramètre 'dish' qui est le plat de la boucle,
                    // la vue en a besoin pour utiliser les informations du plat de la boucle
                    DishDetailsView(dish: dish)
                } label: {
                    // Construction de la vue en utilisants les informations du plat de la boucle
                    HStack(spacing: 25) {
                        Image(dish.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 112, height: 86)
                            .cornerRadius(8)
                            .padding(.leading, 11)
                            .padding(.vertical, 12)
                        VStack(alignment: .leading) {
                            Text(dish.name)
                                .commonFontStyles(14, .semibold)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text(dish.description)
                                .commonFontStyles(12)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            HStack {
                                Text("\(dish.price, specifier: "%.2f") €")
                                    .commonFontStyles(12, .semibold)
                                Spacer()

                                SpiceView(
                                    spiceLevel: dish.spiceLevel,
                                    size: 12
                                )
                            }
                        }
                        .padding(.vertical, 12)
                        .padding(.trailing, 16)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

// NavigationBar solide pour une compatibilité proche des os < iOS 26
private struct CustomNavigationBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(Color.backgroundMenuScreenView, for: .navigationBar)
    }
}

private extension View {
    func customNavigationBar() -> some View {
        modifier(CustomNavigationBarModifier())
    }
}

#Preview {
    NavigationStack {
        MenuView()
    }
}

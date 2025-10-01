//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Vue principale affichant le menu du restaurant, incluant les entrées et les plats principaux

// Vue qui affiche le menu du restaurant (entrées et plats principaux)
struct MenuView: View {
    // Tableau des entrées récupéré depuis le ViewModel
    let apetizerArray = ViewModel().apetizerArray
    // Tableau des plats principaux récupéré depuis le ViewModel
    let mainCourseArray = ViewModel().mainCourseArray
    // Couleur de fond personnalisée
    var backgroundColorView: Color {
        Color(red: 241/255, green: 241/255, blue: 241/255)
    }
    
    var body: some View {
        // Navigation avec barre d’outils
        NavigationStack {
            // ScrollView contenant la liste des catégories et plats
            ScrollView {
                // Section verticale paresseuse pour optimiser l'affichage
                LazyVStack(alignment: .leading, spacing: 12) {
                    // Titre de la section Entrées
                    Text("Entrées")
                        .foregroundStyle(grayColor)
                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                        .fontWeight(.bold)
                    // Affichage des entrées via la sous-vue RowMenuView
                    RowMenuView(menuItems: apetizerArray)
                    
                    // Titre de la section Plats Principaux
                    Text("Plats Principaux")
                        .padding(.top, 12)
                        .foregroundStyle(grayColor)
                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                        .fontWeight(.bold)
                    // Affichage des plats principaux via la sous-vue RowMenuView
                    RowMenuView(menuItems: mainCourseArray)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            .background(backgroundColorView)
        }
        .font(.custom("PlusJakartaSans-Regular", size: 12))
        .navigationBarTitleDisplayMode(.inline)
        // Configuration de la toolbar affichant le titre "Menu"
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Menu")
                    .font(.custom("PlusJakartaSans-Regular", size: 18))
                    .fontWeight(.bold)
            }
        }
    }
}

// Sous-vue qui affiche une liste de plats sous forme de lignes
struct RowMenuView: View {
    let menuItems: [Dish]
    
    var body: some View {
        // Si aucun plat, affiche un message d'absence de plats
        if menuItems.isEmpty {
            Text("Aucun plat trouvé.")
        } else {
            // Pour chaque plat, affiche une ligne cliquable menant au détail
            ForEach(menuItems, id: \.name) { dish in
                NavigationLink {
                    // Vue détaillée du plat sélectionné
                    MenuDetailsView(dish: dish)
                } label: {
                    // Structure visuelle de la ligne de plat
                    HStack(spacing: 25) {
                        // Image du plat avec taille et coins arrondis
                        Image(dish.imageName)
                            .resizable()
                            .frame(width: 112, height: 86)
                            .cornerRadius(8)
                            .padding(.leading, 11)
                            .padding(.vertical, 12)
                        VStack(alignment: .leading) {
                            // Nom du plat
                            Text(dish.name)
                                .font(.custom("PlusJakartaSans-Regular", size: 14))
                                .fontWeight(.semibold)
                                .foregroundStyle(grayColor)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            // Description du plat
                            Text(dish.description)
                                .font(.custom("PlusJakartaSans-Regular", size: 12))
                                .font(.subheadline)
                                .foregroundStyle(grayColor)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            // Ligne contenant le prix et l'indicateur de niveau d'épices
                            HStack {
                                // Prix formaté avec deux décimales
                                Text("\(dish.price, specifier: "%.2f") €")
                                    .font(.caption)
                                    .foregroundStyle(grayColor)
                                    .font(.custom("PlusJakartaSans-Regular", size: 12))
                                    .fontWeight(.semibold)
                                Spacer()
                                // Affichage du niveau d'épices avec une vue spécifique
                                switch dish.spiceLevel {
                                case .hot:
                                    SpiceView(spiceLevel: 3, size: 12)
                                case .medium:
                                    SpiceView(spiceLevel: 2, size: 12)
                                case .light:
                                    SpiceView(spiceLevel: 1, size: 12)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .padding(.trailing, 16)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuView()
    }
}

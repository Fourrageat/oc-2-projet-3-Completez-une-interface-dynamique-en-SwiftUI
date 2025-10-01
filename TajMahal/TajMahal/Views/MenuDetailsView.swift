//
//  MenuDetailsView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 24/09/2025.
//

import SwiftUI

// Vue qui affiche le détail d’un plat (image, allergènes, ingrédients, niveau d’épices)
struct MenuDetailsView: View {
    // Plat à afficher
    let dish: Dish

    var body: some View {
        // Structure verticale de la page de détails
        VStack(alignment: .leading, spacing: 0) {
            // Image du plat et badge niveau d’épices en superposition
            ZStack(alignment: .top) {
                Image(dish.imageName)
                    .resizable()
                    .cornerRadius(10)
                    .frame(height: 467)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                VStack {
                    HStack {
                        Spacer()
                        Group {
                            switch dish.spiceLevel {
                            case .hot:
                                SpiceView(spiceLevel: 3, size: 14)
                            case .medium:
                                SpiceView(spiceLevel: 2, size: 14)
                            case .light:
                                SpiceView(spiceLevel: 1, size: 14)
                            }
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .cornerRadius(11)
                    }
                }
                .padding([.top, .trailing], 12)
            }
            // Section affichant les allergènes du plat
            Text("Allergènes:")
                .padding(.top, 32)
                .foregroundStyle(grayColor)
                .font(.custom("PlusJakartaSans-Regular", size: 12))
                .fontWeight(.semibold)
            Text(dish.allergens)
                .padding(.top, 8)
                .padding(.bottom, 15)
                .foregroundStyle(grayColor)
                .font(.custom("PlusJakartaSans-Regular", size: 12))
            Divider()
            // Section affichant les ingrédients du plat
            Text("Ingrédients:")
                .padding(.top, 15)
                .foregroundStyle(grayColor)
                .font(.custom("PlusJakartaSans-Regular", size: 12))
                .fontWeight(.semibold)
            Text(dish.ingredients)
                .padding(.top, 8)
                .foregroundStyle(grayColor)
                .font(.custom("PlusJakartaSans-Regular", size: 12))
        }
        // Affiche le nom du plat dans la barre d’outils en haut de l’écran
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity, alignment: .top)
        .font(.custom("PlusJakartaSans-Regular", size: 12))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(dish.name)
                    .font(.custom("PlusJakartaSans-Regular", size: 18))
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuDetailsView(dish: ViewModel().apetizerArray[1])
    }
}

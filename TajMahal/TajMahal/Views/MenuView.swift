//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI


struct MenuView: View {
    // Tableau des entrées récupéré depuis le ViewModel
    let apetizerArray = ViewModel().apetizerArray
    // Tableau des plats principaux récupéré depuis le ViewModel
    let mainCourseArray = ViewModel().mainCourseArray
    // Couleur de fond personnalisée
    var backgroundColorView: Color {
        Color(red: 241/255, green: 241/255, blue: 241/255)
    }
    
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    Text("Entrées")
                        .foregroundStyle(grayColor)
                        .font(Font.plusJakartaSansRegular(size: 14))
                        .fontWeight(.bold)
                    RowMenuView(menuItems: apetizerArray)
                    
                    Text("Plats Principaux")
                        .padding(.top, 12)
                        .foregroundStyle(grayColor)
                        .font(Font.plusJakartaSansRegular(size: 14))
                        .fontWeight(.bold)
                    RowMenuView(menuItems: mainCourseArray)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            .background(backgroundColorView)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if #available(iOS 26.0, *) {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                    }
                }
                .sharedBackgroundVisibility(.hidden)
                ToolbarItem(placement: .principal) {
                    Text("Menu")
                        .font(Font.plusJakartaSansRegular(size: 18))
                        .fontWeight(.bold)
                        .fixedSize()
                }
            } else {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Menu")
                        .font(Font.plusJakartaSansRegular(size: 18))
                        .fontWeight(.bold)
                        .fixedSize()
                }
            }
        }
    }
}

struct RowMenuView: View {
    let menuItems: [Dish]
    
    var body: some View {
        if menuItems.isEmpty {
            Text("Aucun plat trouvé.")
        } else {
            ForEach(menuItems, id: \.name) { dish in
                NavigationLink {
                    MenuDetailsView(dish: dish)
                } label: {
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
                                .font(Font.plusJakartaSansRegular(size: 14))
                                .fontWeight(.semibold)
                                .foregroundStyle(grayColor)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text(dish.description)
                                .font(Font.plusJakartaSansRegular(size: 12))
                                .font(.subheadline)
                                .foregroundStyle(grayColor)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            HStack {
                                Text("\(dish.price, specifier: "%.2f") €")
                                    .font(.caption)
                                    .foregroundStyle(grayColor)
                                    .font(Font.plusJakartaSansRegular(size: 12))
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

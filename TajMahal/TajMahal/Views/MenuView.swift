//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI


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
                    RowMenuView(dishes: apetizerArray)
                    
                    Text("Plats Principaux")
                        .commonFontStyles(14.0, .bold)
                        .padding(.top, 12)
                    RowMenuView(dishes: mainCourseArray)
                }
                .padding(.horizontal, 20)
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
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

struct RowMenuView: View {
    let dishes: [Dish]
    
    var body: some View {
        if dishes.isEmpty {
            Text("Aucun plat trouvé.")
        } else {
            ForEach(dishes, id: \.name) { dish in
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


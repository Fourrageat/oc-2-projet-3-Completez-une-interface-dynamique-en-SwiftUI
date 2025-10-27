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
        .customToolBar()
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

private struct CustomToolBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(Color.backgroundMenuScreenView, for: .navigationBar)
    }
}

private extension View {
    func customToolBar() -> some View {
        modifier(CustomToolBarModifier())
    }
}

#Preview {
    NavigationStack {
        MenuView()
    }
}


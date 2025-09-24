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
    var backgroundColorView: Color {
        Color(red: 241/255, green: 241/255, blue: 241/255)
    }
    
    var body: some View {
        
        ZStack {
            backgroundColorView.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Entrées")
                    RowMenuView(menuItems: apetizerArray)
                    Text("Plats Principaux")
                        .padding(.top, 12)
                    RowMenuView(menuItems: mainCourseArray)
                }
                .padding(.horizontal, 20)
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
                    
                HStack(spacing: 25) {
                    Image(dish.imageName)
                        .resizable()
                        .frame(width: 112, height: 86)
                        .cornerRadius(8)
                        .padding(.leading, 11)
                        .padding(.vertical, 12)
                    VStack(alignment: .leading) {
                        Text(dish.name)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        Spacer()
                        Text(dish.description)
                            .font(.system(size: 12))
                            .font(.subheadline)
                        Spacer()
                        HStack {
                            Text("\(dish.price, specifier: "%.2f") €")
                                .font(.caption)
                            Spacer()
                            switch dish.spiceLevel {
                            case .hot:
                                Text("3")
                            case .medium:
                                Text("2")
                            case .light:
                                Text("1")
                            }
                        }
                    }
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

#Preview {
    MenuView()
}

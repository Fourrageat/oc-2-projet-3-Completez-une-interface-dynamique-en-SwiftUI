//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

var backgroundColorView: Color {
    Color(red: 241/255, green: 241/255, blue: 241/255)
}

struct MenuView: View {
    let apetizerArray = ViewModel().apetizerArray
    
    var body: some View {
        
        ZStack {
            backgroundColorView.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    
                    if apetizerArray.isEmpty {
                        Text("Aucun plat principal trouvé.")
                    } else {
                        ForEach(apetizerArray, id: \.name) { dish in
                                
                            HStack(spacing: 12) {
                                Image(dish.imageName)
                                    .resizable()
                                    .frame(width: 112, height: 86)
                                    .cornerRadius(8)
                                    .padding(.horizontal, 11)
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
                            .padding(.horizontal, 20)
                        }
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    MenuView()
}

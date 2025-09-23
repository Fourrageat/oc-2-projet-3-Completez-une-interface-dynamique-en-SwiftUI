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
    let mainCourseArray = ViewModel().mainCourseArray
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
                                VStack(alignment: .leading) {
                                    Text(dish.name)
                                        .font(.headline)
                                    Text(dish.description)
                                        .font(.subheadline)
                                    HStack {
                                        Text("\(dish.price) €")
                                            .font(.caption)
                                    }
                                }
                                .padding(.vertical, 12)
                            }
                            .background(Color.white)
                            .cornerRadius(10)
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

//
//  MenuDetailsView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 24/09/2025.
//

import SwiftUI

struct MenuDetailsView: View {
    let dish: Dish
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Image(dish.imageName)
                    .resizable()
                    .cornerRadius(10)
                    .frame(height: 467)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }
            Text("ALLergènes:")
                .padding(.top, 32)
            Text(dish.allergens)
                .padding(.top, 8)
                .padding(.bottom, 15)
            Divider()
            Text("Ingrédients:")
                .padding(.top, 15)
            Text(dish.ingredients)
                .padding(.top, 8)
        }
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle(dish.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MenuDetailsView(dish: ViewModel().apetizerArray[1])
    }
}

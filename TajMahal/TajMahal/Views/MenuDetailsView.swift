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
            Text("Allergènes:")
                .padding(.top, 32)
                .font(.system(size: 12))
                .foregroundStyle(grayColor)
                .fontWeight(.bold)
            Text(dish.allergens)
                .padding(.top, 8)
                .padding(.bottom, 15)
                .font(.system(size: 12))
                .foregroundStyle(grayColor)
            Divider()
            Text("Ingrédients:")
                .padding(.top, 15)
                .font(.system(size: 12))
                .foregroundStyle(grayColor)
                .fontWeight(.bold)
            Text(dish.ingredients)
                .padding(.top, 8)
                .font(.system(size: 12))
                .foregroundStyle(grayColor)
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

//
//  MenuDetailsView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 24/09/2025.
//

import SwiftUI

struct MenuDetailsView: View {
    // Plat à afficher
    let dish: Dish
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .top) {
                Image(dish.imageName)
                    .resizable()
                    .aspectRatio(3/4, contentMode: .fit)
                    .clipped()
                    .cornerRadius(10)
                    
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
            Text("Allergènes:")
                .padding(.top, 32)
                .foregroundStyle(grayColor)
                .font(Font.plusJakartaSansRegular(size: 12))
                .fontWeight(.semibold)
            Text(dish.allergens)
                .padding(.top, 8)
                .padding(.bottom, 15)
                .foregroundStyle(grayColor)
                .font(Font.plusJakartaSansRegular(size: 12))
            Divider()
            // Section affichant les ingrédients du plat
            Text("Ingrédients:")
                .padding(.top, 15)
                .foregroundStyle(grayColor)
                .font(Font.plusJakartaSansRegular(size: 12))
                .fontWeight(.semibold)
            Text(dish.ingredients)
                .padding(.top, 8)
                .foregroundStyle(grayColor)
                .font(Font.plusJakartaSansRegular(size: 12))
        }
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity, alignment: .top)
        .font(Font.plusJakartaSansRegular(size: 12))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if #available(iOS 26.0, *) {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                        }
                        Text(dish.name)
                            .font(Font.plusJakartaSansRegular(size: 18))
                            .fontWeight(.bold)
                            .fixedSize()
                    }
                }
                .sharedBackgroundVisibility(.hidden)
            } else {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.black)
                        }
                        Text(dish.name)
                            .font(Font.plusJakartaSansRegular(size: 18))
                            .fontWeight(.bold)
                            .fixedSize()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuDetailsView(dish: ViewModel().apetizerArray[1])
    }
}

//
//  MenuDetailsView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 24/09/2025.
//

import SwiftUI

struct MenuDetailsView: View {
    let dish: Dish
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .top) {
                GeometryReader { geometry in
                    Image(dish.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height,
                        )
                        .cornerRadius(10)
                }

                VStack {
                    HStack {
                        Spacer()
                        SpiceView(
                            spiceLevel: dish.spiceLevel,
                            size: 14
                        )
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .cornerRadius(11)
                    }
                }
                .padding([.top, .trailing], 12)
            }
            Text("Allergènes:")
                .commonFontStyles(12, .semibold)
                .padding(.top, 32)
            Text(dish.allergens)
                .commonFontStyles(12)
                .padding(.top, 8)
                .padding(.bottom, 15)
            Divider()
            Text("Ingrédients:")
                .commonFontStyles(12, .semibold)
                .padding(.top, 15)
            Text(dish.ingredients)
                .commonFontStyles(12)
                .padding(.top, 8)
        }
        .padding(.top, {
            if #available(iOS 26.0, *) {
                return 6.0
            } else {
                return 12.0
            }
        }())
        .padding([.horizontal, .bottom], 20)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if #available(iOS 26.0, *) {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color.appBlack)
                                .padding(.leading, -10)
                        }
                        Text(dish.name)
                            .commonFontStyles(18, Color.appBlack, .bold)
                            .fixedSize()
                    }
                }
                .sharedBackgroundVisibility(.hidden)
            } else {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color.appBlack)
                                .fontWeight(.semibold)
                                
                        }
                        Text(dish.name)
                            .commonFontStyles(18, Color.appBlack, .bold)
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

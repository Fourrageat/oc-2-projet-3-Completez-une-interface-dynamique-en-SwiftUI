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
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            Text("Allergènes:")
                .padding(.top, 32)
                .foregroundStyle(grayColor)
                .font(Font.defaultFont(size: 12))
                .fontWeight(.semibold)
            Text(dish.allergens)
                .padding(.top, 8)
                .padding(.bottom, 15)
                .foregroundStyle(grayColor)
                .font(Font.defaultFont(size: 12))
            Divider()
            Text("Ingrédients:")
                .padding(.top, 15)
                .foregroundStyle(grayColor)
                .font(Font.defaultFont(size: 12))
                .fontWeight(.semibold)
            Text(dish.ingredients)
                .padding(.top, 8)
                .foregroundStyle(grayColor)
                .font(Font.defaultFont(size: 12))
        }
        .padding(.top, {
            if #available(iOS 26.0, *) {
                return 8.0
            } else {
                return 12.0
            }
        }())
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if #available(iOS 26.0, *) {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(blackColor)
                        }
                        Text(dish.name)
                            .foregroundStyle(blackColor)
                            .font(Font.defaultFont(size: 18))
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
                                .foregroundStyle(blackColor)
                                .fontWeight(.semibold)
                                
                        }
                        Text(dish.name)
                            .foregroundStyle(blackColor)
                            .font(Font.defaultFont(size: 18))
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

//
//  MenuDetailsView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 24/09/2025.
//

import SwiftUI

struct MenuDetailsView: View {
    let menu: Dish
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .top) {
                GeometryReader { geometry in
                    Image(menu.imageName)
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
                            switch menu.spiceLevel {
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
                .commonFontStyles(12, .semibold)
                .padding(.top, 32)
            Text(menu.allergens)
                .commonFontStyles(12)
                .padding(.top, 8)
                .padding(.bottom, 15)
            Divider()
            Text("Ingrédients:")
                .commonFontStyles(12, .semibold)
                .padding(.top, 15)
            Text(menu.ingredients)
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
                                .foregroundStyle(Color.appBlack)
                                .padding(.leading, -10)
                        }
                        Text(menu.name)
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
                        Text(menu.name)
                            .commonFontStyles(18, Color.appBlack, .bold)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuDetailsView(menu: ViewModel().apetizerArray[1])
    }
}

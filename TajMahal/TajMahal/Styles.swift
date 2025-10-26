//
//  ColorsStyles.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 22/10/2025.
//

import SwiftUI

extension Color {
    static var backgroundMenuScreenView: Color { Color(red: 241/255, green: 241/255, blue: 241/255) }
    static var appGray: Color { Color(red: 102/255, green: 102/255, blue: 102/255) }
    static var appRed: Color { Color(red: 207/255, green: 47/255, blue: 47/255) }
    static var appBlack: Color { Color(red: 51/255, green: 51/255, blue: 51/255) }
}

struct CommonFontStylesModifier: ViewModifier {
    let size: CGFloat
    let color: Color
    let weight: Font.Weight?
    func body(content: Content) -> some View {
        content
            .foregroundStyle(color)
            .font(Font.DefaultFont(size: size))
            .fontWeight(weight)
    }
}

extension View {

    func commonFontStyles(_ size: CGFloat, _ weight: Font.Weight?) -> some View {
        modifier(CommonFontStylesModifier(size: size, color: .appGray, weight: weight))
    }

    func commonFontStyles(_ size: CGFloat, _ color: Color = .appGray, _ weight: Font.Weight? = nil) -> some View {
        modifier(CommonFontStylesModifier(size: size, color: color, weight: weight))
    }
}

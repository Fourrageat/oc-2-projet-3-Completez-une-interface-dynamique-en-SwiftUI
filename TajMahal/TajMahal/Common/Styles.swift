//
//  Styles.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 22/10/2025.
//

import SwiftUI

extension Color {
    static var backgroundMenuScreenView: Color {
        Color(red: 241/255, green: 241/255, blue: 241/255)
    }
    static var appGray: Color {
        Color(red: 102/255, green: 102/255, blue: 102/255)
    }
    static var appRed: Color {
        Color(red: 207/255, green: 47/255, blue: 47/255)
    }
    static var appBlack: Color {
        Color(red: 51/255, green: 51/255, blue: 51/255)
    }
}

// Modifieur de vue pouvant être commun à tous les textes présents dans le projet.
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

// Extention permettant d'appliquer CommonFontStylesModifier aux vues.
// Par defaut les paramètres Color.appGray et .regular sont appliqués.
// La taille de police est obligatoire
extension View {

    /// Applique un style de police commun à la vue avec la couleur par défaut `.appGray`.
    /// - Parameters:
    ///   - size: Taille de la police à appliquer.
    ///   - weight: Épaisseur (poids) de la police. Peut être `nil` pour utiliser le poids par défaut.
    /// - Returns: Une vue stylisée avec la police par défaut du projet, la couleur `.appGray` et le poids fourni.
    func commonFontStyles(_ size: CGFloat, _ weight: Font.Weight?) -> some View {
        modifier(CommonFontStylesModifier(size: size, color: .appGray, weight: weight))
    }

    /// Applique un style de police commun à la vue avec paramètres personnalisables.
    /// - Parameters:
    ///   - size: Taille de la police à appliquer (obligatoire).
    ///   - color: Couleur du texte. Valeur par défaut: `.appGray`.
    ///   - weight: Épaisseur (poids) de la police. Valeur par défaut: `nil` (poids système par défaut).
    /// - Returns: Une vue stylisée avec la police par défaut du projet, la couleur et le poids fournis.
    func commonFontStyles(_ size: CGFloat, _ color: Color = .appGray, _ weight: Font.Weight? = nil) -> some View {
        modifier(CommonFontStylesModifier(size: size, color: color, weight: weight))
    }
}

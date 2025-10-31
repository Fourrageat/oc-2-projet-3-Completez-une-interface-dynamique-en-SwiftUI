//
//  SpiceLevelView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 30/09/2025.
//

import SwiftUI

/// Une vue SwiftUI qui affiche le niveau d'épices d'un plat sous forme de 3 icônes de piment.
/// - Parameters:
///   - spiceLevel: Le niveau d'épices à représenter (light, medium, hot).
///   - size: La taille (largeur/hauteur) des icônes de piment en points.
struct SpiceLevelView: View {
    let spiceLevel: SpiceLevel
    let size: PimentSize

    var body: some View {
        HStack(spacing: 8) {
            // Affiche 3 icônes de piment : chaque index inférieur à
            // spiceLevelInt est rouge, sinon l'icône est grise.
            ForEach(0..<3) { index in
                Image(
                    index < spiceLevel.rawValue
                    ? PimentColor.hard.rawValue
                    : PimentColor.soft.rawValue
                )
                .resizable()
                .frame(width: size.rawValue, height: size.rawValue)
            }
        }
    }
}

#Preview {
    let levels: [SpiceLevel] = [.light, .medium, .hot]

    VStack(alignment: .center, spacing: 40) {
        ForEach(levels, id: \.self) { level in
            SpiceLevelView(spiceLevel: level, size: PimentSize.big)
        }
    }

    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black)
    .ignoresSafeArea()
}

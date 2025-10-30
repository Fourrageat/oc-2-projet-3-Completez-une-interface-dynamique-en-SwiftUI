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
    let size: CGFloat
    
    var spiceLevelInt: Int {
        switch spiceLevel {
        case .hot:
            return 3
        case .medium:
            return 2
        case .light:
            return 1
        }
    }

    var body: some View {
        HStack(spacing: 8) {
            // Affiche 3 icônes de piment : chaque index inférieur à
            // spiceLevelInt est rouge, sinon l'icône est grise.
            ForEach(0..<3) { index in
                Image(index < spiceLevelInt ? "piment-red" : "piment")
                    .resizable()
                    .frame(width: size, height: size)
            }
        }
    }
}

#Preview {
    let levels: [SpiceLevel] = [.light, .medium, .hot]

    VStack(alignment: .center, spacing: 40) {
        ForEach(levels, id: \.self) { level in
            SpiceLevelView(spiceLevel: level, size: 40)
        }
    }

    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black)
    .ignoresSafeArea()
}

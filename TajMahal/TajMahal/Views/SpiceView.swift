//
//  SpiceView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 30/09/2025.
//

import SwiftUI

// Vue utilitaire pour afficher le niveau d'épices avec des icônes de piment.

@ViewBuilder
func SpiceView(spiceLevel: Int, size: CGFloat) -> some View {
    // spiceLevel : niveau de piquant (de 0 à 3)
    // size : taille des icônes
    HStack(spacing: 8) { // Affiche les piments côte à côte avec un espacement
        // Pour chaque index, affiche un piment rouge si l'utilisateur a atteint ce niveau, sinon un piment normal
        ForEach(0..<3) { index in
            Image(index < spiceLevel ? "piment-red" : "piment")
                .resizable()
                .frame(width: size, height: size)
        }
    }
}

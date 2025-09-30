//
//  SpiceView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 30/09/2025.
//

import SwiftUI

@ViewBuilder
func SpiceView(spiceLevel: Int, size: CGFloat) -> some View {
    HStack(spacing: 8) {
        ForEach(0..<3) { index in
            Image(index < spiceLevel ? "piment-red" : "piment")
                .resizable()
                .frame(width: size, height: size)
        }
    }
}

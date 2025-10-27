//
//  SpiceView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 30/09/2025.
//

import SwiftUI

struct SpiceView: View {
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
            ForEach(0..<3) { index in
                Image(index < spiceLevelInt ? "piment-red" : "piment")
                    .resizable()
                    .frame(width: size, height: size)
            }
        }
    }
}

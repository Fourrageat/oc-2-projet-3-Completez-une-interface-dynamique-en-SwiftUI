//
//  SpiceView.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 30/09/2025.
//

import SwiftUI

struct SpiceView: View {
    var spiceLevel: Int
    var size: CGFloat

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Image(index < spiceLevel ? "piment-red" : "piment")
                    .resizable()
                    .frame(width: size, height: size)
            }
        }
    }
}

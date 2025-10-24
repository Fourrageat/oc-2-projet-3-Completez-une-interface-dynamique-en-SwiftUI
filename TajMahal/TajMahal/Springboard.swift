//
//  Springboard.swift
//  TajMahal
//
//  Created by Baptiste FOURRAGEAT on 24/10/2025.
//

import SwiftUI

struct Springboard: View {
    var body: some View {
        ZStack {
            Color.appRed
                .ignoresSafeArea()
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100, maxHeight: 100)
        }
    }
}

#Preview {
    Springboard()
}

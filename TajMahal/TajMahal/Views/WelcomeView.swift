//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Page d'accueil
struct WelcomeView: View {
    var body: some View {
        NavigationStack {

            VStack {
                Image("TajMahal")
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Restaurant indient")
                        .font(.custom("Plus jakarta Sans", size: 12))
                    
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Text("Taj Mahal")
                        .font(.custom("Plus jakarta Sans", size: 18))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                }
                
                VStack(alignment: .trailing, spacing: 8) {
                    Image("Logo")
                }
            }


            Spacer()

            NavigationLink {
                MenuView()
            } label: {
                Text("Menu")
            }
        }
    }
}

#Preview {
    WelcomeView()
}

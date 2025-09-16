//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste
struct MenuView: View {
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let viewModel: ViewModel = ViewModel()
    
    var body: some View {
//        List(viewModel.mainCourseArray, id: \.name) { mainCourse in
//            VStack(alignment: .leading) {
//                Text(mainCourse.name)
//                Text(mainCourse.description)
//                Text(mainCourse.allergens)
//            }
//        }
    }
}

#Preview {
    MenuView()
}

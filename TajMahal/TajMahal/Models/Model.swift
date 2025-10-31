//
//  Model.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import Foundation
import SwiftUI

// Cette énumération répertorie 3 niveaux de piment
enum SpiceLevel: Int {
    case light = 1
    case medium
    case hot
}

// Cette énumération permet de différencier 3 tailles différentes de l'image des piments
enum PimentSize: CGFloat {
    case small = 12, medium = 14, big = 40
}

// Cette énumération permet de choisir la couleur de l'image du piment
enum PimentColor: String {
    case hard = "RedPiment"
    case soft = "GrayPiment"
}

// Représente l'objet "plat", qui figure sur la carte du menu
struct Dish {
    var name: String
    var description: String
    var allergens: String
    var ingredients: String
    var spiceLevel: SpiceLevel
    var imageName: String
    var price: Double
}

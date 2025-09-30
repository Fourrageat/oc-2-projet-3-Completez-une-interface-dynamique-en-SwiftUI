//
//  Model.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import Foundation
import SwiftUI

// Cette enumération répertorie 3 niveaux de piment
enum SpiceLevel {
    case light
    case medium
    case hot
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

// Font color
var grayColor: Color { Color(red: 102/255, green: 102/255, blue: 102/255) }
var redColor: Color { Color(red: 207/255, green: 47/255, blue: 47/255) }

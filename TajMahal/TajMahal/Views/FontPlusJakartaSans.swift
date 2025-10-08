// Création d'une extension pour le font "PlusJakartaSans-Regular"
// Placez ce fichier dans le projet pour pouvoir utiliser Font.plusJakartaSansRegular(size:)
import SwiftUI

extension Font {
    static func plusJakartaSansRegular(size: CGFloat) -> Font {
        .custom("PlusJakartaSans-Regular", size: size)
    }
}

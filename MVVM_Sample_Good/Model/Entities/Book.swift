//
//  Book.swift
//  Protocol1
//
//  Created by brown on 2021/09/03.
//

import Foundation
import SwiftUI

struct Book: Identifiable {
    var id: Int
    var title: String
    var author: String
    var price: Double
    var imageName: String
}

extension Book {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

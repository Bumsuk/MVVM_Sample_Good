//
//  BookDetail.swift
//  Protocol1
//
//  Created by brown on 2021/09/03.
//

import Foundation
import SwiftUI

struct BookDetail {
    var id: String
    var bookId: Int
    var author: String
    var title: String
    var price: Double
    var genre: [Genre]
    var kind: String
    var description: String
    var imageName: String
    var isAvailable: Bool
}

extension BookDetail {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

//
//  Cart.swift
//  Protocol1
//
//  Created by brown on 2021/09/03.
//

import Foundation

struct Item: Identifiable {
    var id: String
    var item: Book
    var units: Int
}

struct Cart {
    var items: [Item]
    var numberOfItems: Int
    var total: Double
}

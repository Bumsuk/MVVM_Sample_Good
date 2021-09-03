//
//  BookService.swift
//  MVVM_Sample_Good
//
//  Created by brown on 2021/09/03.
//

import Foundation

protocol BookService {
    // Book list
    func bookList() -> [Book]
    
    // Book detail
    func bookDetails(bookId: Int) -> BookDetail
    func numberOfCartItems() -> Int
    func addToCart(bookId: Int)
    
    // Cart
    func cartItems() -> Cart
    func checkout()
}



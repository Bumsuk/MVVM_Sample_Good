//
//  MVVM_Sample_GoodApp.swift
//  MVVM_Sample_Good
//
//  Created by brown on 2021/09/03.
//

import SwiftUI

@main
struct MVVM_Sample_GoodApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView(viewModel: AnyViewModel<BookListState, Never>(BookListViewModel(service: MockBookService())))
        }
    }
}

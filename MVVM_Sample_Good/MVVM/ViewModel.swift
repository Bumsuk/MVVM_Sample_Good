//
//  ViewModel.swift
//  Protocol1
//
//  Created by brown on 2021/09/03.
//

import Combine
import Foundation

// https://levelup.gitconnected.com/building-an-ios-app-using-swiftui-combine-mvvm-part-2-a0a703269907
// https://github.com/quickbirdstudios/SwiftUI-Architectures/blob/master/QBChat-MVVM/QBChat-MVVM/MVVM/ViewModel.swift

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Input
    
    var state: State { get }
    func trigger(_ input: Input)
}

@dynamicMemberLookup // ! 와.... 대박인데? 꼭 이해해야겠네. 멤버를 막 찾아가네??
final class AnyViewModel<State, Input>: ViewModel {
    
    // MARK: Stored properties
    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let wrappedState: () -> State
    private let wrappedTrigger: (Input) -> Void
    
    // MARK: Computed properties
    var objectWillChange: AnyPublisher<Void, Never> {
        wrappedObjectWillChange()
    }
    
    var state: State {
        wrappedState()
    }
    
    // MARK: Methods
    func trigger(_ input: Input) {
        wrappedTrigger(input)
    }
    
    // dynamicMemberLookup! 구현필!
    subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        state[keyPath: keyPath]
    }
    
    // MARK: Initialization
    init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Input == Input {
        self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
        self.wrappedState = { viewModel.state }
        self.wrappedTrigger = viewModel.trigger
    }
}

extension AnyViewModel: Identifiable where State: Identifiable {
    var id: State.ID {
        state.id
    }
}

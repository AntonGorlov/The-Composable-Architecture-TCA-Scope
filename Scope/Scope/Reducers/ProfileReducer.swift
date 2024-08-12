//
//  ProfileReducer.swift
//  Scope
//
//  Created by Anton Gorlov on 06.08.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ProfileReducer {
    
    @ObservableState
    struct State {
    }
    
    enum Action {
        case logoutAction
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
            
        case .logoutAction:
            print("Logout")
            return .none
        }
    }
}

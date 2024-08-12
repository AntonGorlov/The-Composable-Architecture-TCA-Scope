//
//  RegistrationReducer.swift
//  Scope
//
//  Created by Anton Gorlov on 06.08.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RegistrationReducer {
  
    @ObservableState
    struct State  {
        var isLastRegistrationScreen = false
        var isRegistrationCompleted = false
    }
    
    enum Action {
        case startRegistrationAction
        case finishRegistrationUserAction
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
            
        case .startRegistrationAction:
            
            state.isLastRegistrationScreen = true
        
            print("Last screen on the registration flow")
            return .none
            
        case .finishRegistrationUserAction:
            
            state.isRegistrationCompleted = true
            state.isLastRegistrationScreen = false
            print("User has been registered")
            return .none
        }
    }
}

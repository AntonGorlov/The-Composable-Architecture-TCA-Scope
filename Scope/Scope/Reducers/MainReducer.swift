//
//  MainReducer.swift
//  Scope
//
//  Created by Anton Gorlov on 06.08.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainReducer {
    
    @ObservableState
    struct State {
        var registrationState = RegistrationReducer.State()
        var profileState      = ProfileReducer.State()
    }
    
    enum Action {
        case registrationAction(RegistrationReducer.Action)
        case profileAction(ProfileReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        // If we want to redirect some of the actions to a child reducer, then we use this
        Scope(state: \.registrationState, action: \.registrationAction) {
            
            RegistrationReducer()
        }
        
        Scope(state: \.profileState, action: \.profileAction) {
            
            ProfileReducer()
        }
        
        // Reducer parent processing
        Reduce { state, action in
            
            switch action {

            case .registrationAction(_):
                return .none
                
            case .profileAction(let actionParent):
             
                switch actionParent {
                    
                case .logoutAction:
                    
                    state.registrationState.isRegistrationCompleted = false
                    return .none
                }
            }
        }
    }
}

// Actions are processed in the parent reducer
// It is necessary to tell the child reducer that some actions need to be passed to the child reducer

// The reducer is represented as a body.
// var body: allows you to combine reducers like views in a SwiftUi (var body: some View {...})
// Allows you to write reducers in a column

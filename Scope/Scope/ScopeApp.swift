//
//  ScopeApp.swift
//  Scope
//
//  Created by Anton Gorlov on 06.08.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct ScopeApp: App {
    var body: some Scene {
        WindowGroup {
            
            MainView(store: Store(initialState: MainReducer.State(), 
                                  reducer: {
                
                MainReducer()
            }))
        }
    }
}

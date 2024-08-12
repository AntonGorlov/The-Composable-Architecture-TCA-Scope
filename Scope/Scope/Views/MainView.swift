//
//  MainView.swift
//  Scope
//
//  Created by Anton Gorlov on 06.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    
    var store: StoreOf<MainReducer>
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            if store.registrationState.isRegistrationCompleted {
                
                //allows you to build a reducer (store) and bind it to the field of the parent reducer (store)
                let profileViewStore = store.scope(state: \.profileState, action: \.profileAction)
                ProfileView(store: profileViewStore)
                
            } else {
              
                let registrationViewStore = store.scope(state: \.registrationState, action: \.registrationAction)
                RegistrationView(store: registrationViewStore)
          
            }
        }
        
    }
    
}

#Preview {
    
    let mainStore = Store(initialState: MainReducer.State()) {
        MainReducer()
    }
    
    return MainView(store: mainStore)
}

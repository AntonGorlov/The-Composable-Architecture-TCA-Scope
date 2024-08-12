//
//  RegistrationView.swift
//  Scope
//
//  Created by Anton Gorlov on 06.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct RegistrationView: View {
    
    var store: StoreOf<RegistrationReducer>
    
    var body: some View {
     
        if store.isLastRegistrationScreen {
            
            Button(action: {
                
                store.send(.finishRegistrationUserAction)
            }, label: {
                
                Text("Finish registration")
            })
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .controlSize(.large)
            
        } else {
            
            Button(action: {
                
                store.send(.startRegistrationAction)
            }, label: {
                
                Text("Start registration")
            })
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .controlSize(.large)
        }
    }
}

#Preview {
    
    let store = Store(initialState: RegistrationReducer.State()) {
        
        RegistrationReducer()
    }
    
    return RegistrationView(store: store)
}

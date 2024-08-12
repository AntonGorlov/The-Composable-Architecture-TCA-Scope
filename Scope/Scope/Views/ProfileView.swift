//
//  ProfileView.swift
//  Scope
//
//  Created by Anton Gorlov on 06.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct ProfileView: View {
    
    var store: StoreOf<ProfileReducer>
    
    var body: some View {
        
        Button(action: {
            
            store.send(.logoutAction)
            
        }, label: {
            
            Text("Logout")
        })
        .buttonStyle(.borderedProminent)
        .tint(.green)
        .controlSize(.large)
    }
}

#Preview {
    
    let store = Store(initialState: ProfileReducer.State()) {
        ProfileReducer()
    }
    
    return ProfileView(store: store)
}

//
//  ContentView.swift
//  TestBankApp
//
//  Created by Nikita on 06.02.2023.
//

import SwiftUI
import KeychainSwift

struct ContentView: View {
    var body: some View {
       
        if (isActiveSession()) {
            HomeView(isNewSession: false)
        } else {
            LandingView()
        }
       
    }
    
    private func isActiveSession() -> Bool {
        let keychain = KeychainSwift()
        let token = keychain.get("session_token")
        
        return token == "ABRA-CA-DABRA"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

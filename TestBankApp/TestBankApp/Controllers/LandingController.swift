//
//  LandingController.swift
//  TestBankApp
//
//  Created by Nikita on 07.02.2023.
//

import Foundation
import KeychainSwift

class LandingController {
    
    // I assume the best way to store the token of session is to put it in keychain
    func startSession() {
        let keychain = KeychainSwift()
        keychain.set("ABRA-CA-DABRA", forKey: "session_token")
    }
    
}

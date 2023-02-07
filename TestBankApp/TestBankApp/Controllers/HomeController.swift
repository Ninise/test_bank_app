//
//  HomeController.swift
//  TestBankApp
//
//  Created by Nikita on 07.02.2023.
//

import Foundation
import KeychainSwift

class HomeController {
    
    func loadUserAccounts() -> [Account] {
        
        if let data = JsonUtils.readLocalFile(forName: "listOfAccounts") {
            return self.parse(jsonData: data)
        } else {
            return []
        }
        
    }
    
    func cancelSession() {
        let keychain = KeychainSwift()
        keychain.clear()
    }
    
    private func parse(jsonData: Data) -> [Account] {
        let str = String(decoding: jsonData, as: UTF8.self)
        
        do {
            let decodedData = try JSONDecoder().decode([Account].self, from: jsonData)
            
            return decodedData
        } catch {
            print(error)
            return []
        }
    }
    
}

//
//  JsonUtils.swift
//  TestBankApp
//
//  Created by Nikita on 07.02.2023.
//

import Foundation

class JsonUtils {
    
    // Pass the name of json file in the root directory (/TestBankApp) ex. forName: "listOfAccounts"
    class func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
}

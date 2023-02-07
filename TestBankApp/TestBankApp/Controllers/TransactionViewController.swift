//
//  TransactionViewController.swift
//  TestBankApp
//
//  Created by Nikita on 07.02.2023.
//

import Foundation

class TransactionViewController {
    
    func getAccountTransactions(id: UInt32) -> [Transaction] {
        
        // read the file and get Data
        if let data = JsonUtils.readLocalFile(forName: "accountTransactions") {
            
            // parse it to array of dictionaries
            let allTransactions = parse(jsonData: data)
                        
            var searchedAcc: [Transaction] = []
            
            // search in that array a dictionary with required id
            for account in allTransactions {
                if let acc = account["\(id)"] {
                    searchedAcc = acc
                }
            }
            
            
            if (searchedAcc.isEmpty) {
                return []
            } else {
                return searchedAcc
            }
            
        } else {
            return []
        }
        
    }
    
    private func parse(jsonData: Data) -> [[String:[Transaction]]] {
        
        do {
            let accountsTransactions = try JSONDecoder().decode([[String:[Transaction]]].self, from: jsonData)
            
            return accountsTransactions
        } catch {
            print(error)
            return []
        }
    }

    
}

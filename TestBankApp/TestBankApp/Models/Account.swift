//
//  Account.swift
//  TestBankApp
//
//  Created by Nikita on 06.02.2023.
//

import Foundation

//{
//       "id":10,
//       "display_name": "Chequing Account",
//       "account_number": "3157419",
//       "balance": 102406.86
//}

struct Account: Codable {
    var id: UInt32
    var displayName: String
    var accountNumber: String
    var balance: Float
    
    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
        case accountNumber = "account_number"
        case balance
    }
}

//
//  Activity.swift
//  TestBankApp
//
//  Created by Nikita on 06.02.2023.
//

import Foundation

//{
//               "id": 160,
//               "date": "2017-12-01",
//               "description": "Interest Posting",
//               "withdrawal_amount": 37.83,
//               "balance": 101226.9,
//               "transaction_uid": 9620390650
//}

struct Activity: Codable {
    
    var id: UInt64
    var date: String
    var description: String?
    var withdrawalAmount: Float?
    var depositAmount: Float?
    var balance: Float
    var transactionUid: UInt64?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case description
        case withdrawalAmount = "withdrawal_amount"
        case depositAmount = "deposit_amount"
        case balance
        case transactionUid = "transaction_uid"
    }
}

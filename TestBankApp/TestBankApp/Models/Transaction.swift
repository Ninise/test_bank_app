//
//  TfsaAccount.swift
//  TestBankApp
//
//  Created by Nikita on 06.02.2023.
//

import Foundation

//        "date": "2017-12-01",
//        "activity": [
//            {
//                "id": 160,
//                "date": "2017-12-01",
//                "description": "Interest Posting",
//                "withdrawal_amount": 37.83,
//                "balance": 101226.9,
//                "transaction_uid": 9620390650
//            }
//        ]

struct TfsaAccount: Codable {
    
    var date: String
    var activity: [Activity]
    
    enum CodingKeys: String, CodingKey {
        case date
        case activity
    }
}

//
//  TransactionsHistoryView.swift
//  TestBankApp
//
//  Created by Nikita on 06.02.2023.
//

import SwiftUI

struct TransactionsHistoryView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let controller = TransactionViewController()
    
    @State var accountId: UInt32 = 0
    
    var body: some View {
        
        let transactions = controller.getAccountTransactions(id: accountId)
        
        NavigationView {
            VStack {
                
                if transactions.isEmpty {
                    Text("No Transactions for this type of account")
                        .foregroundColor(Color.black)
                } else {
                    List {
                        ForEach(transactions, id: \.date) { parentTransaction in
                            
                            Text("Transactions date: \(parentTransaction.date)")
                                .padding(.bottom, 1)
                            
                            ForEach(parentTransaction.activity, id: \.id) { transaction in
                                
                                TransactionView(transaction: transaction)
                                
                            }
                            
                        }
                        
                    }
                    .listStyle(.plain)
                }
                
                
            }
            .navigationTitle("Transactions History")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.gray)
                        .font(.system(size: 25))
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
                
            }
            
        }
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.light)
    }
}

struct TransactionsHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsHistoryView(accountId: 12)
    }
}

struct TransactionView: View {
    
    @State var transaction: Activity
    
    var body: some View {
        HStack {
            
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 45, height: 45)
                .scaledToFit()
            
            VStack (alignment: .leading) {
                HStack {
                    Text("Withdraw")
                    Spacer()
                    Text("\(String(format: "%.2f", transaction.withdrawalAmount ?? 0.0)) CAD")
                }
                
                Text("\(transaction.description ?? "")")
                    .padding(.vertical, 1)
                
                HStack {
                    Text("\(transaction.date)")
                    Spacer()
                    Text("Balance: \(String(format: "%.2f", transaction.balance))")
                }
                
                
            }
            .padding(.bottom, 10)
            .padding(.horizontal, 10)
        }
        .padding(.leading, 10)
    }
}

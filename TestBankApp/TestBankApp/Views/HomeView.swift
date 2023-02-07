//
//  HomeView.swift
//  TestBankApp
//
//  Created by Nikita on 06.02.2023.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // I use it to track if user get to this page from landing
    // and in case of clicking Quit pop this view
    @State var isNewSession = false
    @State var goToLandingView = false
    
    
    init(isNewSession: Bool) {
        UINavigationBar.appearance().barTintColor = UIColor(.black)
        UINavigationBar.appearance().backgroundColor = UIColor(.white)
        self.isNewSession = isNewSession
    }
    
    let controller = HomeController()
    
    var body: some View {
        
        let accounts: [Account] = controller.loadUserAccounts()
        
        NavigationView {
            
            VStack {
                NavigationLink(destination: LandingView(),
                               isActive: $goToLandingView,
                               label: {  })
                
                if accounts.isEmpty {
                    Text("Accounts not found")
                        .foregroundColor(Color.black)
                } else {
                    List {
                        ForEach(accounts, id: \.id) { account in
                            NavigationLink(destination: TransactionsHistoryView(accountId: account.id)) {
                                AccountListItemView(account: account)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.top, 15)
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("Statement of #000000")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    controller.cancelSession()
                    
                    // if we get there from the Landing just pop up this view
                    if (isNewSession) {
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        // in this case navigate to the landing
                        goToLandingView = true
                    }
                } label: {
                    HStack {
                        Text("Quit")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(10)
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .scaledToFit()
                            .tint(.black)
                            .padding(.horizontal, -15)
                    }
                }
                
                
            }
        }
        .preferredColorScheme(.light)
        .navigationBarBackButtonHidden()
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isNewSession: false)
    }
}

struct AccountListItemView: View {
    
    @State var account: Account
    
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack {
                VStack (alignment: .leading) {
                    Text(account.displayName)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("Account Number: \(account.accountNumber)")
                        .foregroundColor(.black)
                        .lineLimit(1)
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Spacer()
                    Text("Balance: \(String(format: "%.2f", account.balance))")
                        .foregroundColor(account.balance >= 0 ? .green : .red)
                    
                    
                }
            }
            .padding(2)
            .padding(.bottom, 5)
        })
    }
}

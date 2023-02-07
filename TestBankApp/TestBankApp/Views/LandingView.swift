//
//  LandingView.swift
//  TestBankApp
//
//  Created by Nikita on 06.02.2023.
//

import SwiftUI

struct LandingView: View {
    
    @State var goToHomeView = false
    
    let controller = LandingController()
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .center) {
                NavigationLink(destination: HomeView(isNewSession: true),
                               isActive: $goToHomeView,
                               label: {  })
                
                Button(action: {
                    controller.startSession()
                    goToHomeView = true
                }, label: {
                    Text("Open")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .padding(5)
                        .background(Color.black)
                        .cornerRadius(30)
                        .padding(.horizontal, 20)
                })
            }
        }
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.light)
        
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

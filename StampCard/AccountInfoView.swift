//
//  AccountInfoView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

import Firebase

struct AccountInfoView: View {
    
    @State var email = "test@gmail.com"
    @Binding var isShowAccountInfoView: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("メールアドレス")
                    .padding()
                Text(email)
                    .padding()
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text("アカウント情報"), displayMode:.inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.Logout()
            }) {
                Text("ログアウト")
        })
    }
    
    func Logout(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            firebaseUser = nil
            numberOfVisits = 0
            self.isShowAccountInfoView.toggle()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

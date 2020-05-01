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
    @State private var isShowAlert = false
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
                self.isShowAlert.toggle()
            }) {
                Text("ログアウト")
        })
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text("ログアウトしてもよろしいですか？"),
                      primaryButton:
                    .cancel(Text("キャンセル"),action: {print("cancel tapped")}),
                      secondaryButton:
                    .destructive(Text("ログアウト"),
                                 action: {
                                    self.Logout()
                                    print("logout tapped")}))
        }
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

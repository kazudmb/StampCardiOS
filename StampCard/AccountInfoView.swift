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
    @State private var isShowActionSheet = false
    @Binding var isShowAccountInfoView: Bool
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("選択してください"),buttons: [
            .default(Text("メールアドレス変更"),action: {}),
            .default(Text("パスワード変更"),action: {}),
            .destructive(Text("ログアウト"),action: {self.isShowAlert.toggle()}),
            .cancel()
        ])
    }
    
    var alert: Alert{
        Alert(title: Text("ログアウトしてもよろしいですか？"),
              primaryButton:
            .cancel(Text("キャンセル"),action: {print("cancel tapped")}),
              secondaryButton:
            .destructive(Text("ログアウト"),
                         action: {
                            self.Logout()
                            print("logout tapped")}))
    }
    
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
                self.isShowActionSheet.toggle()
            }) {
                Image(systemName: "ellipsis.circle")
            }
            .actionSheet(isPresented: $isShowActionSheet, content: {self.actionSheet})
            .alert(isPresented: $isShowAlert, content: {self.alert})
        )
            .foregroundColor(Color.black)
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

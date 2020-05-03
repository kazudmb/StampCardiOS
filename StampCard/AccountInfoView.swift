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
    
    @State private var isShowAlert = false
    @State private var isShowActionSheet = false
    @State private var isShowChangeEmailView = false
    @State private var isShowChangePasswordView = false
    @Binding var isShowAccountInfoView: Bool
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("選択してください"),buttons: [
            .default(Text("メールアドレス変更"),action: {self.isShowChangeEmailView.toggle()}),
            .default(Text("パスワード変更"),action: {self.isShowChangePasswordView.toggle()}),
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
        ZStack {
            HStack {
                VStack(alignment: .leading){
                    Text("メールアドレス")
                        .padding()
                    if firebaseUser?.email != nil {
                        Text((firebaseUser?.email)!)
                            .padding()
                    } else {
                        Text("")
                            .padding()
                    }
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
            NavigationLink(destination: ChangeEmailView(isShowChangeEmailView: $isShowChangeEmailView), isActive: $isShowChangeEmailView) {
                EmptyView()
            }
            NavigationLink(destination: ChangePasswordView(isShowChangePasswordView: $isShowChangePasswordView), isActive: $isShowChangePasswordView) {
                EmptyView()
            }
        }
    }
    
    func Logout(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            firebaseUser = nil
            numberOfVisitsGlobal = 0
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

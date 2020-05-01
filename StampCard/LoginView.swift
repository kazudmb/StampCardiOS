//
//  LoginView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

import Firebase

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State private var isInvalidEmail = false
    @State private var isInvalidPassword = false
    @State var isShowCreateAccountView = false
    @State var isShowChangePasswordView = false
    @Binding var isShowLoginView: Bool
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack {
                    Text("メールアドレス")
                    if isInvalidEmail {
                        Text("入力してください")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                TextField("メールアドレス", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Text("パスワード")
                    if isInvalidPassword {
                        Text("入力してください")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                TextField("パスワード", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: {
                self.Login()
            }){
                Text("ログイン")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            HStack {
                Button(action: {
                    self.isShowChangePasswordView.toggle()
                }){
                    Text("＊パスワードを忘れた方はこちら")
                        .foregroundColor(Color.black)
                }
                Button(action: {
                    self.isShowCreateAccountView.toggle()
                }){
                    Text("新規登録")
                        .foregroundColor(Color.black)
                }
            }
            .padding()
            .padding(.top)
            .navigationBarTitle(Text("ログイン"), displayMode:.inline)
            NavigationLink(destination: ChangePasswordView(isShowLoginView: $isShowLoginView), isActive: $isShowChangePasswordView) {
                EmptyView()
            }
            .isDetailLink(false)
            NavigationLink(destination: CreateAccountView(isShowLoginView: $isShowLoginView), isActive: $isShowCreateAccountView) {
                EmptyView()
            }
            .isDetailLink(false)
        }
    }
    
    func Login(){
        if validateForm() {
            Auth.auth().signIn(withEmail: email, password: password) { [] authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                firebaseUser = authResult?.user
                print(authResult?.user.email as Any)
                print(authResult?.user.uid as Any)
                self.isShowLoginView.toggle()
            }
        }
    }
    
    func validateForm() -> Bool {
        var valid = true
        
        if self.email == "" {
            self.isInvalidEmail = true
            valid = false
        } else {
            self.isInvalidEmail = false
        }
        
        if self.password == "" {
            self.isInvalidPassword = true
            valid = false
        } else {
            self.isInvalidPassword = false
        }
        
        return valid
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

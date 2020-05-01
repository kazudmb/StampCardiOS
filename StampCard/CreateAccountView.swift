//
//  CreateAccountView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

import Firebase

struct CreateAccountView: View {
    
    @State var email = ""
    @State var password = ""
    @State private var isInvalidEmail = false
    @State private var isInvalidPassword = false
    @Binding var isShowLoginView: Bool
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                Text("メールアドレス")
                    .padding()
                HStack {
                    TextField("メールアドレス", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    if isInvalidEmail {
                        Text("入力してください")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                Text("パスワード")
                    .padding()
                HStack {
                    TextField("パスワード", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    if isInvalidPassword {
                        Text("入力してください")
                            .foregroundColor(.red)
                    }
                }
                .padding()
            }
            Button(action:{
                self.CreateAccount()
            }) {
                Text("新規登録")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .navigationBarTitle(Text("新規登録"), displayMode:.inline)
    }
    
    func CreateAccount() {
        if validateForm() {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    return
                }
                firebaseUser = user
                self.isShowLoginView.toggle()
                print("\(user.email!) created")
            }
        }
    }
    
    func validateForm() -> Bool {
        var valid = true
        
        if self.email == "" {
            self.isInvalidEmail = true
        } else {
            self.isInvalidEmail = false
            valid = false
        }
        
        if self.password == "" {
            self.isInvalidPassword = true
        } else {
            self.isInvalidPassword = false
            valid = false
        }
        
        return valid
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

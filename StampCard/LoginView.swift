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
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("メールアドレス")
                    .padding()
                TextField("メールアドレス", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("パスワード")
                    .padding()
                TextField("パスワード", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Text("ログイン")
                .padding()
                .foregroundColor(Color.white)
                .background(Color.gray)
                .cornerRadius(10)
                .shadow(radius: 5)
                .gesture(TapGesture(count:1)
                    .onEnded(){
                        self.Login()
                })
            HStack {
                NavigationLink(destination:
                ChangePasswordView()) {
                    Text("＊パスワードを忘れた方はこちら")
                }
                .foregroundColor(Color.black)
                NavigationLink(destination:
                CreateAccountView()) {
                    Text("新規登録")
                }
                .foregroundColor(Color.black)
            }
            .padding()
            .padding(.top)
        }
        .navigationBarTitle(Text("ログイン"), displayMode:.inline)
    }
    
    func Login(){
        Auth.auth().signIn(withEmail: email, password: password) { [] authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print(authResult?.user.email)
            print(authResult?.user.uid)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

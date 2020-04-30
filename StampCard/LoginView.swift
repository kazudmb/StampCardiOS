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
    @Binding var isShowLoginView: Bool
    
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
            firebaseUser = authResult?.user
            print(authResult?.user.email as Any)
            print(authResult?.user.uid as Any)
            self.isShowLoginView.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

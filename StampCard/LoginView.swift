//
//  LoginView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

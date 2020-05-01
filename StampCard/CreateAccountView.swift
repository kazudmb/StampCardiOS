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
    @Binding var isShowLoginView: Bool
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                Text("メールアドレス")
                    .padding()
                TextField("入力して下さい", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("パスワード")
                    .padding()
                TextField("パスワード", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
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

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

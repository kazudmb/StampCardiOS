//
//  ChangeEmailView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

struct ChangeEmailView: View {
    @State var email = ""
    @State var password = ""
    @State private var isInvalidEmail = false
    @State private var isInvalidPassword = false
    
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
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                HStack {
                    Text("パスワード")
                    if isInvalidPassword {
                        Text("入力してください")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                TextField("パスワード", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            Text("送信")
                .padding()
                .padding(.leading)
                .padding(.trailing)
                .foregroundColor(Color.white)
                .background(Color.gray)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .navigationBarTitle(Text("メールアドレス変更"), displayMode:.inline)
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

struct ChangeEmailView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeEmailView()
    }
}

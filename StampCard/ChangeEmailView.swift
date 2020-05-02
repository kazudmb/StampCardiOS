//
//  ChangeEmailView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

import Firebase

struct ChangeEmailView: View {
    @State var email = ""
    @State var password = ""
    @State private var isInvalidEmail = false
    @State private var isInvalidPassword = false
    @Binding var isShowChangeEmailView: Bool
    
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
            Button(action: {
                self.reauthenticate()
            }){
                Text("送信")
                    .padding()
                    .padding(.leading)
                    .padding(.trailing)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .navigationBarTitle(Text("メールアドレス変更"), displayMode:.inline)
    }
    
    private func reauthenticate(){
        
        let credential: AuthCredential = EmailAuthProvider.credential(withEmail: "\(String(firebaseUser?.email ?? ""))", password: password)
        firebaseUser?.reauthenticate(with: credential, completion: { (result: AuthDataResult?, error: Error?) in
            if error != nil {
                print("error:\(String(describing: error?.localizedDescription))")
            } else {
                self.updateEmail()
                print("success:\(String(describing: result?.credential.debugDescription))")
            }
        })
    }
    
    private func updateEmail() {
        
        firebaseUser?.updateEmail(to: email) { error in
            if error != nil {
                print("error:\(String(describing: error?.localizedDescription))")
            } else {
                self.sendEmailVerification()
                self.isShowChangeEmailView.toggle()
                print("success:no message)")
            }
        }
    }
    
    private func sendEmailVerification() {
        
        firebaseUser?.sendEmailVerification(completion: { (error) in
            if error != nil {
                print("error:\(String(describing: error?.localizedDescription))")
            } else {
                print("success:no message)")
            }
        })
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
        EmptyView()
    }
}

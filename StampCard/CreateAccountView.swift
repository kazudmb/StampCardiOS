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
        
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        UIApplication.shared.closeKeyboard()
                }
                VStack{
                    VStack(alignment: .leading){
                        HStack {
                            Text("メールアドレス")
                                .foregroundColor(Color.primary)
                            if isInvalidEmail {
                                Text("入力してください")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                        .padding(.top)
                        TextField("メールアドレス", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        HStack {
                            Text("パスワード")
                                .foregroundColor(Color.primary)
                            if isInvalidPassword {
                                Text("入力してください")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                        SecureField("パスワード", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
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
            }
            .navigationBarTitle(Text("新規登録"), displayMode:.inline)
        }
    }
    
    private func CreateAccount() {
        if validateForm() {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    return
                }
                firebaseUser = user
                self.createCollection()
                print("\(user.email!) created")
            }
        }
    }
    
    private func createCollection() {
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        let db = Firestore.firestore()
        let user = [
            "NumberOfVisits": 0
        ]
        
        db.collection("users").document("\(String(firebaseUser?.uid ?? ""))").setData(user) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                self.sendEmailVerification()
                self.isShowLoginView.toggle()
                print("Document successfully written!")
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

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

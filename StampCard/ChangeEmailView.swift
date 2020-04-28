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
}

struct ChangeEmailView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeEmailView()
    }
}

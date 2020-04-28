//
//  CreateAccountView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State var email = ""
    @State var password = ""
    
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
            Text("新規登録")
                .padding()
                .foregroundColor(Color.white)
                .background(Color.gray)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .navigationBarTitle(Text("新規登録"), displayMode:.inline)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

//
//  ChangePasswordView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @State var email = ""
    @Binding var isShowLoginView: Bool
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                Text("登録時に入力したメールアドレスを入力してください。パスワード再設定の手順を送信します。")
                    .padding()
                Text("メールアドレス")
                    .padding()
                TextField("メールアドレス", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: {
                self.isShowLoginView.toggle()
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
        .navigationBarTitle(Text("パスワードの再設定"), displayMode:.inline)
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

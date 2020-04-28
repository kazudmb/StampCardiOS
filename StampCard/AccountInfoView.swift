//
//  AccountInfoView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/24.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

struct AccountInfoView: View {
    @State var email = "test@gmail.com"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("メールアドレス")
                    .padding()
                Text(email)
                    .padding()
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text("アカウント情報"), displayMode:.inline)
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoView()
    }
}
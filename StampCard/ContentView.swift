//
//  ContentView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/23.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // @Stateを使ってUIの状態と同期をとる
    @State var labelText = "来店回数："
    @State var number = 0
    @State var times = "回"
    @State var rank = "会員ランク：メンバー"
    @State private var isShowingSettingModal = false
    @State var show = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack{
                        Image("sample")
                        HStack {
                            Text(labelText)
                            Text(String(number))
                            Text(times)
                            Text(rank)
                        }
                        .padding()
                        HStack() {
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                        }
                        HStack() {
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                            Image("logo_stamp_area_icon")
                                .border(Color.orange, width: 2)
                        }
                        Text("特典内容：スタンプカードが40ポイント貯まると、シャンパン1本をサービス致します！")
                            .padding()
                            .padding(.bottom)
                            .lineLimit(nil)
                        
                        Button(action: {
                            self.isShowingSettingModal.toggle()
                        }){
                            Text("スタンプを押してもらう")
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .sheet(isPresented: self.$isShowingSettingModal) {
                            QRCodeDisplayView()
                        }
                    }
                    Spacer()
                }
                .navigationBarTitle(Text("Stamp Card"), displayMode:.inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination:
                    LoginView()) {
                        Image(systemName: "arrowshape.turn.up.right")
                })
                    .foregroundColor(Color.black)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

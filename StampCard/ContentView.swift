//
//  ContentView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/23.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let numberOfVisitsText = "来店回数："
    private let times = "回"
    @State private var isShowingSettingModal = false
    @State private var isShowLoginView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack{
                        Image("sample")
                        HStack {
                            Text(numberOfVisitsText)
                            Text(String(numberOfVisits))
                            Text(times)
                            if numberOfVisits < 20 {
                                Text("会員ランク：メンバー")
                            } else if numberOfVisits < 40 {
                                Text("会員ランク：シルバー")
                            } else {
                                Text("会員ランク：ゴールド")
                            }
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
                    HStack {
                        if firebaseUser == nil {
                            Button(action: {
                                self.isShowLoginView.toggle()
                            }) {
                                Image(systemName: "arrowshape.turn.up.right")
                            }
                        } else {
                            NavigationLink(destination:AccountInfoView()) {
                                Image(systemName: "person.crop.circle")
                            }
                        }
                    }
                )
                    .foregroundColor(Color.black)
                NavigationLink(destination: LoginView(isShowLoginView: $isShowLoginView), isActive: $isShowLoginView) {
                    EmptyView()
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

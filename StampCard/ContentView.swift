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
    @State private var isShowAccountInfoView = false
    
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
                        ZStack {
                            HStack {
                                ForEach(0..<5) { _ in
                                    Image("logo_stamp_area_icon")
                                        .border(Color.orange, width: 2)
                                }
                            }
                            HStack {
                                ForEach(0..<getNumberOfStamp()[0]) { _ in
                                    Image("logo_approved")
                                        .border(Color.orange, width: 2)
                                }
                            }
                        }
                        ZStack {
                            HStack {
                                ForEach(0..<5) { _ in
                                    Image("logo_stamp_area_icon")
                                        .border(Color.orange, width: 2)
                                }
                            }
                            HStack {
                                ForEach(0..<getNumberOfStamp()[1]) { _ in
                                    Image("logo_approved")
                                        .border(Color.orange, width: 2)
                                }
                            }
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
                            Button(action: {
                                self.isShowAccountInfoView.toggle()
                            }) {
                                Image(systemName: "person.crop.circle")
                            }
                        }
                    }
                )
                    .foregroundColor(Color.black)
                NavigationLink(destination: LoginView(isShowLoginView: $isShowLoginView), isActive: $isShowLoginView) {
                    EmptyView()
                }
                NavigationLink(destination: AccountInfoView(isShowAccountInfoView: $isShowAccountInfoView), isActive: $isShowAccountInfoView) {
                    EmptyView()
                }
            }
        }
    }
    
    private func getNumberOfStamp() -> [Int] {
        
        var numberOfStamp: [Int] = []
        let numberOfVisitsString: String = String(numberOfVisits)
        let numberOfCutOut = Int(numberOfVisitsString.prefix(numberOfVisitsString.count - 1))
        
        if (numberOfCutOut == 0 && Int(numberOfVisitsString) ?? 0 < 10) {
            // do nothing
            return [0,0]
        } else {
            if numberOfCutOut == 0 {
                numberOfStamp = [5,5]
            } else {
                if numberOfCutOut ?? 0 < 5 {
                    numberOfStamp = [Int(numberOfCutOut ?? 0), 0]
                } else {
                    numberOfStamp = [5, Int(numberOfCutOut ?? 0 - 5)]
                }
            }
        }
        
        return numberOfStamp
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

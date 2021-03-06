//
//  ContentView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/23.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI

import Firebase

struct ContentView: View {
    private let numberOfVisitsText = "来店回数："
    private let times = "回"
    @State private var numberOfVisits = 0
    @State private var numberOfStampArea :[Bool] = [false, false, false, false, false, false, false, false, false, false]
    @State private var isShowAlert = false
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
                                .foregroundColor(Color.primary)
                            Text(String(self.numberOfVisits))
                                .foregroundColor(Color.primary)
                            Text(times)
                                .foregroundColor(Color.primary)
                            if self.numberOfVisits < 40 {
                                Text("会員ランク：メンバー")
                                    .foregroundColor(Color.primary)
                            } else if self.numberOfVisits < 80 {
                                Text("会員ランク：シルバー")
                                    .foregroundColor(Color.primary)
                            } else {
                                Text("会員ランク：ゴールド")
                                    .foregroundColor(Color.primary)
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                        HStack {
                            if numberOfStampArea[0] {
                                ZStack {
                                    Image("logo_stamp_area_icon1")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            }  else {
                                Image("logo_stamp_area_icon1")
                                    .border(Color.secondary, width: 1)
                            }
                            if numberOfStampArea[1] {
                                ZStack {
                                    Image("logo_stamp_area_icon2")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon2")
                                    .border(Color.secondary, width: 1)
                            }
                            if numberOfStampArea[2] {
                                ZStack {
                                    Image("logo_stamp_area_icon3")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon3")
                                    .border(Color.secondary, width: 1)
                            }
                            if numberOfStampArea[3] {
                                ZStack {
                                    Image("logo_stamp_area_icon4")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon4")
                                    .border(Color.secondary, width: 1)
                            }
                            if numberOfStampArea[4] {
                                ZStack {
                                    Image("logo_stamp_area_icon5")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon5")
                                    .border(Color.secondary, width: 1)
                            }
                        }
                        HStack {
                            if numberOfStampArea[5] {
                                ZStack {
                                    Image("logo_stamp_area_icon6")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon6")
                                    .border(Color.secondary, width: 1)
                            }
                            if numberOfStampArea[6] {
                                ZStack {
                                    Image("logo_stamp_area_icon7")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon7")
                                    .border(Color.secondary, width: 1)
                            }
                            if numberOfStampArea[7] {
                                ZStack {
                                    Image("logo_stamp_area_icon8")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon8")
                                    .border(Color.secondary, width: 1)
                            }
                            if numberOfStampArea[8] {
                                ZStack {
                                    Image("logo_stamp_area_icon9")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon9")
                                    .border(Color.secondary, width: 1)
                            }
                            if numberOfStampArea[9] {
                                ZStack {
                                    Image("logo_stamp_area_icon10")
                                        .border(Color.secondary, width: 1)
                                    Image("logo_stamp_icon")
                                        .border(Color.secondary, width: 1)
                                }
                            } else {
                                Image("logo_stamp_area_icon10")
                                    .border(Color.secondary, width: 1)
                            }
                        }
                        
                        Text("特典内容：スタンプカードが40ポイント貯まると、シャンパン1本をサービス致します！")
                            .foregroundColor(Color.primary)
                            .padding()
                            .padding(.leading)
                            .padding(.trailing)
                            .padding(.bottom)
                            .lineLimit(nil)
                        
                        Button(action: {
                            if firebaseUser == nil {
                                self.isShowAlert.toggle()
                            } else {
                                self.isShowingSettingModal.toggle()
                            }
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
                        .alert(isPresented: $isShowAlert) {
                            Alert(title: Text("ログインしてください"))
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
                                Image(systemName: "arrowshape.turn.up.right").imageScale(.large)
                            }
                        } else {
                            Button(action: {
                                self.isShowAccountInfoView.toggle()
                            }) {
                                Image(systemName: "person.crop.circle").imageScale(.large)
                            }
                        }
                    }
                )
                    .foregroundColor(Color.primary)
                NavigationLink(destination: LoginView(isShowLoginView: $isShowLoginView), isActive: $isShowLoginView) {
                    EmptyView()
                }
                NavigationLink(destination: AccountInfoView(isShowAccountInfoView: $isShowAccountInfoView), isActive: $isShowAccountInfoView) {
                    EmptyView()
                }
                .onAppear {
                    self.getNumberOfVisits()
                }.onDisappear {
                    self.getNumberOfVisits()
                }
            }
        }
    }
    
    private func getNumberOfVisits() {
        
        if firebaseUser != nil {
            
            let settings = FirestoreSettings()
            Firestore.firestore().settings = settings
            let db = Firestore.firestore()
            
            db.collection("users").document("\(String(firebaseUser?.uid ?? ""))").getDocument { (document, err) in
                if let document = document, document.exists {
                    self.numberOfVisits = document.data()?["NumberOfVisits"] as? Int ?? 0
                    self.setStamp()
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    print("Document data: \(dataDescription)")
                } else {
                    print("Document does not exist")
                }
            }
        } else {
            self.numberOfVisits = 0
            self.setStamp()
        }
    }
    
    private func setStamp() {
        
        for i in 1...10 {
            numberOfStampArea[i - 1] = false
        }
        
        var loopCount = 0
        let numberOfVisitsString: String = String(self.numberOfVisits)
        let numberOfCutOut = Int(numberOfVisitsString.suffix(1))
        
        if (numberOfCutOut == 0 && Int(numberOfVisitsString) ?? 0 < 10) {
            // do nothing
            return
        } else {
            if numberOfCutOut == 0 {
                loopCount = 10
            } else {
                loopCount = Int(numberOfCutOut ?? 0)
            }
        }
        
        for i in 1...loopCount {
            numberOfStampArea[i - 1] = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

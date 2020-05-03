//
//  QRCodeDisplayView.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/04/23.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import SwiftUI
import UIKit

struct QRCodeDisplayView: View {
    var body: some View {
        VStack {
            makeQRCode()
                .padding()
            Text("このQRコードを提示して下さい")
                .foregroundColor(Color.primary)
                .padding()
        }
        .navigationBarTitle(Text("読み取り用QRコード"), displayMode:.inline)
    }
}

struct makeQRCode: View {
    var body: some View {
        let img = UIImage.makeQRCode(text: "\(String(firebaseUser?.uid ?? ""))")!
        return Image(uiImage: img)
    }
}

// Utilityに入れること
extension UIImage {
    /**
     文字列からQRコードを作成します
     - parameters:
         - text: 読み込んだ時のデータ文字列
     */
    static func makeQRCode(text: String) -> UIImage? {
        guard let data = text.data(using: .utf8) else { return nil }
        guard let QR = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data]) else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        guard let ciImage = QR.outputImage?.transformed(by: transform) else { return nil }
        guard let cgImage = CIContext().createCGImage(ciImage, from: ciImage.extent) else { return nil }
        return UIImage(cgImage: cgImage)
    }
}

struct QRCodeDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeDisplayView()
    }
}

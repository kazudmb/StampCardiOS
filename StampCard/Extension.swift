//
//  Extension.swift
//  StampCard
//
//  Created by KazukiNakano on 2020/05/06.
//  Copyright © 2020 kazudmb. All rights reserved.
//

import Foundation

import SwiftUI

extension UIApplication {
    public func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

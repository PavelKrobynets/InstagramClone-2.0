//
//  Extentions.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 22.12.2021.
//

import SwiftUI
import UIKit

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

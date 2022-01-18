//
//  ProfileInfo.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 18.01.2022.
//

import SwiftUI

struct ProfileInfo: View {
    var text: String
    var count: Int
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.system(size: 17, weight: .semibold))
            Text(text)
                .font(.system(size: 15))
        }
    }
}


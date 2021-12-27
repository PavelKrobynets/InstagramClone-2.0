//
//  NotificationCell.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 27.12.2021.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack{
            Image("Hermione")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text("Hermione: ")
                .font(.system(size: 14, weight: .semibold))
            + Text("followed you.").font(.system(size: 15))
            + Text("2h").foregroundColor(.gray).font(.system(size: 12))
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("follow")
                        .padding(.horizontal,32)
                        .padding(.vertical, 7)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
            }
             
        }.padding(.horizontal, 4)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}

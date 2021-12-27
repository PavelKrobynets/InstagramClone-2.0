//
//  UserCell.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 27.12.2021.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack{
            Image("Hermione")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Grandger")
                    .font(.system(size: 16, weight: .semibold))
                
                Text("Hermione Grandger")
                    .font(.system(size: 15))
            }
            Spacer()
        }.padding(.leading)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}

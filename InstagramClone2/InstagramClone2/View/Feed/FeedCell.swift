//
//  FeedCell.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image("Hermione")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                .frame(width: 45, height: 45)
                .padding(.bottom, -5)
                
                Text("Hermione")
                    .font(.system(size: 15, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            Image("Hermione")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                
         // buttons
            HStack(spacing: 15){
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }

            }.font(.system(size: 22))
                .padding([.leading, .top], 8)
                .foregroundColor(Color(.darkGray))
            
            Text("25 likes")
                .font(.system(size: 14, weight: .bold ))
                .padding(.leading, 8)
                .padding(.vertical, 2)
            
            HStack{
                Text("Hermione  ").font(.system(size: 14, weight: .semibold)) + Text("I like books")
                    .font(.system(size: 14, weight: .regular ))
            }.padding(.horizontal, 8)
            
            Text("2h")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .padding(.leading, 8)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}

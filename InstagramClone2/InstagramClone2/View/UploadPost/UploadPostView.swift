//
//  UploadPostView.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var ImagePickerRepresented = false
    
    var body: some View {
        if postImage == nil{
            Button {
                ImagePickerRepresented.toggle()
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top)
                    .foregroundColor(Color("TextColor"))
            }.sheet(isPresented: $ImagePickerRepresented) {
                loadImage()
            } content: {
                ImagePicker(image: $selectedImage)
            }


        }
        else if let image = postImage {
            VStack{
                HStack(alignment: .top){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextArea(text: $captionText, placeholder: "Enter your caption ")
                }.padding()
                Button {
                     
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                
            }
        }
    }
}


extension UploadPostView {
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
        
    }
}

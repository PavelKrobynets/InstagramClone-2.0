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
    @State var width = UIScreen.main.bounds.width
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack{
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
            VStack(spacing: 0){
                HStack(alignment: .top){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your capton", text: $captionText)
                }.padding()
                
                HStack{
                    Button {
                        postImage = nil
                    } label: {
                        Text("Back")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: width / 3, height: 50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                Button {
                    if let image = selectedImage{
                        viewModel.uploadPost(image: image, caption: captionText)
                    }
                    postImage = nil
                    captionText = ""
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: width / 2.5, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                
                }
                Spacer()
                
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



//
//  ProfileHeaderView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 18.01.2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @State var selectedImage : UIImage?
    @State var userImage : Image?
    @State var imagePickerRepresented = false
    @ObservedObject var viewModel: ProfileViewModel

  
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 45) {
                if let profileImage = viewModel.user.profileImageURL {
                    Button {
                        self.imagePickerRepresented.toggle()
                    } label: {
                        KFImage(URL(string: profileImage))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 90, height: 90)
                            .padding(.bottom, -5)
                    }.sheet(isPresented: $imagePickerRepresented, onDismiss: loadImage) {
                        ImagePicker(image: $selectedImage)
                    }
                }
                    else{
                        Button {
                            self.imagePickerRepresented.toggle()
                        } label: {
                            Image("ProfileImage")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .padding(.bottom, -5)
                        }.sheet(isPresented: $imagePickerRepresented, onDismiss: loadImage) {
                            ImagePicker(image: $selectedImage)
                        }


                    }
                
          
                
                HStack(spacing: 30){
                    
                    ProfileInfo(text: "posts", count: 6)
                    ProfileInfo(text: "following", count: 299)
                    ProfileInfo(text: "followers", count: 186)
                    
                }
            }
            
            
            
            Text(viewModel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.leading, 5)
            Text("Mugiwara")
                .font(.system(size: 14))
                .padding(.leading, 4)
        }.foregroundColor(Color("TextColor"))
            .padding(.top)
        
        ProfileButtonView(viewModel: viewModel)
            .padding(.bottom, 5)
    }
}

extension ProfileHeaderView {
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        viewModel.changeProfileImage(image: selectedImage) { _ in
            print("DEBUG: uploaded Image")
        }
    }
}


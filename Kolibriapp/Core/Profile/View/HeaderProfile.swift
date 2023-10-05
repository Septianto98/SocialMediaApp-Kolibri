//
//  HeaderProfile.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 05/10/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import SDWebImageSwiftUI

struct HeaderProfile: View {
    var user = users(id: "6", name: "yantokocheng", profilImage: "https://firebasestorage.googleapis.com/v0/b/kolibri-5923a.appspot.com/o/yantokocheng.png?alt=media&token=4846b6b0-2cea-437a-8cd6-60e25385d019&_gl=1*pf3dw*_ga*MTM2NDc5MTEwOS4xNjk2MzM5NzM1*_ga_CW55HF8NVT*MTY5NjMzOTczNS4xLjEuMTY5NjM0ODM0OS41OC4wLjA.", following: "148", followers: "110k", post: "230", bio: "the daily life of a cat named yanto")
    
    var body: some View {
        
        ZStack (alignment: .bottom){
            LinearGradient(gradient: Gradient(colors: [Color("bluegradi"), Color("bluegradidua")]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            AnimatedImage(url: URL(string: user.profilImage))
                .frame(width: 80, height: 80)
                .offset(y: 36)
                .overlay(Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.white)
                    .offset(y: 36)
                )
        }
        .frame(height: 160)
    
        VStack (spacing: 4){
            Text(user.name)
                .font(.customFont(.medium, fontSize: 16))
                .padding(.top, 32)
                .foregroundColor(Color("font"))
            
            Text(user.bio)
                .font(.customFont(.regular, fontSize: 12))
                .foregroundColor(Color("fontgray"))
        }
        
        HStack (spacing: 68){
            VStack(alignment: .center, spacing: 4){
                Text(user.post)
                    .font(.customFont(.medium, fontSize: 16))
                    .foregroundColor(Color("font"))
                Text("Posts")
                    .font(.customFont(.regular, fontSize: 16))
                    .foregroundColor(Color("font"))
            }
            VStack(alignment: .center, spacing: 4){
                Text(user.following)
                    .font(.customFont(.medium, fontSize: 16))
                    .foregroundColor(Color("font"))
                Text("Following")
                    .font(.customFont(.regular, fontSize: 16))
                    .foregroundColor(Color("font"))
            }
            VStack(alignment: .center, spacing: 4){
                Text(user.followers)
                    .font(.customFont(.medium, fontSize: 16))
                    .foregroundColor(Color("font"))
                Text("Followers")
                    .font(.customFont(.regular, fontSize: 16))
                    .foregroundColor(Color("font"))
            }
        }
        .padding(.top, 16)
        
        
        VStack {
            Button {
                //action
            } label: {
                Text("Edit Profile")
                    .font(.customFont(.regular, fontSize: 16))
                    .foregroundColor(Color("primary"))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 118)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("primary"))
                    )
                    .frame(width: 315)
            }
        }
        .padding(.top, 16)
    }
}



//struct HeaderProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderProfile()
//    }
//}

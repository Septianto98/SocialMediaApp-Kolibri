//
//  ProfileView.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 06/09/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import SDWebImageSwiftUI

struct ProfileView: View {
    @Namespace var animation
    @StateObject var vmProfile = ProfileViewModel()
    @ObservedObject var vmThread = ThreadViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            //MARK: Header background,Profile Picture, and Info Profile
            HeaderProfile()
            
            Divider()
                .padding(.top, 20)
            
            //MARK: Button Post or Like
            filterPostLike
            
            //MARK: Threads in Profile
            ScrollView (showsIndicators: false){
                if vmProfile.selectedFilter == .post {
                    ForEach(vmProfile.threadProfile) {thread in
                        ThreadCell(threads: thread)
                    }
                }
                ForEach(vmThread.threads) {thread in
                    ThreadCell(threads: thread)
                }
            }
        }
    }
    
    
    
    
    
    //MARK: FILTER BUTTON POST OR LIKES
    var filterPostLike: some View {
        HStack{
            ForEach(ProfileButtonModel.allCases, id:\.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.customFont(.regular, fontSize: 16))
                        .foregroundColor(vmProfile.selectedFilter == item ? Color("font") : Color("fontgray"))
                    
                    if vmProfile.selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color("font"))
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "Filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 2)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.vmProfile.selectedFilter = item
                    }
                }
            }
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
    }
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


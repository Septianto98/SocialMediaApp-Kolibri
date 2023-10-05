//
//  HomeView.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 31/08/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import SDWebImageSwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var uservm = UserViewModel()
    @StateObject var threadvm = ThreadViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView (showsIndicators: false) {
                LazyVStack{
                    //MARK: story
                    ScrollView (.horizontal, showsIndicators: false) {
                        LazyHStack (spacing: 12){
                            addStory
                            
                            ForEach (uservm.user) { story in
                                Story(user: story)
                            }
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                        Divider()
                    }
                    
                    //MARK: Threads
                    ForEach(threadvm.threads) {thread in
                        ThreadCell(threads: thread)
                    }
                    
                }
            }
            .refreshable {
                print("DEBUG:Refresh Thread")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Kolibri")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //action notif
                    } label: {
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("font"))
                    }
                }
        }
        
        }
    }
}



//MARK: Add Story first line
var addStory:  some View {
    VStack(alignment: .center, spacing: 4) {
        Image("yantokocheng")
            .resizable()
            .scaledToFill()
            .frame(width: 68, height: 68)
            .clipShape(Circle())
            .overlay(
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 16)
                    .padding([.top,.leading], 48)
                    .foregroundColor(Color("primary"))
            )
        
        Text ("Your Story")
            .font(.customFont(.regular, fontSize: 12))
            .foregroundColor(Color("font"))
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


//MARK: StoryView
struct Story: View{
    var user = users(id: "9", name: "irune", profilImage: "imagee", following: "20", followers: "30", post: "200", bio: "the daily life of a cat named yanto")
    
    var body: some View{
        VStack(alignment: .center, spacing: 4) {
            AnimatedImage(url: URL(string: user.profilImage))
                .resizable()
                .scaledToFill()
                .frame(width: 68, height: 68)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("bluegradi"), Color("bluegradidua")]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                    .frame(width: 72, height: 72)
                )
            
            Text(user.name)
                .font(.customFont(.regular, fontSize: 12))
                .frame(width: 72)
                .lineLimit(1)
                .foregroundColor(Color("font"))
        }
    }
}

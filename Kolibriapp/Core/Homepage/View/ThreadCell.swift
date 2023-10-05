//
//  ThreadCell.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 05/10/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase
import FirebaseFirestoreSwift

struct ThreadCell: View {
    
    var threads = thread(id: "9", username: "irene", imageUsername: "image", date: "01-09-1998", textThread: "text", imageThread: "image", like: false, likeCount: "123", comment: "yas", commentCount: "12", threadCount: "32", viewCount: "123")
    
    @StateObject var viewModel = ThreadViewModel()
    
    var body: some View {
        LazyVStack (alignment: .leading) {
            HStack{
                AnimatedImage(url: URL(string: threads.imageUsername))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("bluegradi"), Color("bluegradidua")]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                        .frame(width: 40, height: 40)
                    )
                
                
                VStack (alignment: .leading, spacing: 4){
                    Text(threads.username)
                        .font(.customFont(.medium, fontSize: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("font"))
                    
                    Text(threads.date)
                        .font(.customFont(.regular, fontSize: 11))
                        .foregroundColor(Color("fontgray"))
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 23, height: 5)
                    .foregroundColor(Color("fontgray"))
            }
            
            
            VStack (alignment: .leading, spacing: 8){
                Text(threads.textThread)
                    .font(.customFont(.regular, fontSize: 15))
                    .foregroundColor(Color("font"))
                
                AnimatedImage(url: URL(string: threads.imageThread))
                    .resizable()
                    .scaledToFill()
                    .frame(width: threads.imageThread.isEmpty ? 0 : 398, height: threads.imageThread.isEmpty ? 0 : 290)
                    .clipped()
                    .cornerRadius(8)
            }
            .padding(.top, 8)
            .padding(.bottom, 12)
            
            HStack (spacing: 8) {
                HStack (spacing: 4){
                    Button {
                        viewModel.likesCount += 1
                        
                    } label: {
                        Image(systemName: threads.like == true ? "heart.fill" : "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .clipped()
                            .foregroundColor(threads.like == true ? Color.red : Color.black)
                    }
                    
                    Text(threads.likeCount)
                        .font(.customFont(.regular, fontSize: 12))
                        .foregroundColor(Color("font"))
                }
                
                HStack (spacing: 4){
                    Button {
                        viewModel.showCommentSheet.toggle()
                    } label: {
                        Image("message-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .clipped()
                            .foregroundColor(Color.red)
                    }
                    .sheet(isPresented: $viewModel.showCommentSheet) {
                        CommentView()
                            .presentationDetents([.medium, .large])
                            .cornerRadius(30)
                    }
                    
                    Text(threads.commentCount)
                        .font(.customFont(.regular, fontSize: 12))
                        .foregroundColor(Color("font"))
                }
                
                HStack (spacing: 4){
                    Button {
                        //action
                    } label: {
                        Image("repeat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .clipped()
                            .foregroundColor(Color.red)
                    }
                    Text(threads.threadCount)
                        .font(.customFont(.regular, fontSize: 12))
                        .foregroundColor(Color("font"))
                }
                
                Spacer()
                
                Text("\(threads.viewCount) views")
                    .font(.customFont(.medium, fontSize: 16))
                    .foregroundColor(Color("font"))
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
        Divider()
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell()
    }
}

//
//  CommentView.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 01/09/23.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct CommentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var commentvm = CommentViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(showsIndicators: false) {
                    LazyVStack{
                        ForEach(commentvm.comments) { comment in
                                HStack(alignment: .top){
                                    AnimatedImage(url: URL(string: comment.profilePic))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 4){
                                        Text(comment.username)
                                            .font(.customFont(.medium, fontSize: 16))
                                            .foregroundColor(Color("font"))
                                        
                                        Text(comment.commentThread)
                                            .font(.customFont(.regular, fontSize: 15))
                                            .foregroundColor(Color("font"))
                                        
                                        //MARK: REPLY
                                        Button {
                                            
                                        } label: {
                                            Text("reply")
                                                .font(.customFont(.medium, fontSize: 14))
                                                .foregroundColor(Color("fontgray"))
                                    }
                                }
                                Spacer()
                            }
                                .padding(.vertical, 16)

                        }
                    }
                }
                
                Divider()
                
                HStack (spacing: 8){
                    Image("yantokocheng")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                    TextField("Add a comment for a irene.ayam", text: $commentvm.commentThread)
                        .foregroundColor(Color("fontgray"))
                        .font(.customFont(.regular, fontSize: 16))
                    
                    Spacer()
                    
                    Image("Send")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .clipped()
                }
                .frame(maxWidth: .infinity, maxHeight: 85)
                .padding(.top, -16)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .navigationTitle("Comments")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.customFont(.regular, fontSize: 16))
                    .foregroundColor(Color("font"))
                })
            }
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}

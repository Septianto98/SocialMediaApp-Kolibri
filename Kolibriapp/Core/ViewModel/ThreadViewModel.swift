//
//  HomeViewModel.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 04/10/23.
//

import Foundation
import Firebase

final class ThreadViewModel: ObservableObject{
    @Published var threads: [thread] = []
    @Published var showCommentSheet: Bool = false
    @Published var likesCount = 30
    
    init(){
        fetchThreadData()
    }
    
    func fetchThreadData() {
        let db = Firestore.firestore()
        
        db.collection("Threads").getDocuments { querySnapshot, error in
            if let error = error {
                print("ERROR GETTING DOCUMENT : \(error.localizedDescription)")
            } else {
                if let querySnapshot = querySnapshot{
                    for document in querySnapshot.documents{
                        let data = document.data()
                        
                        let id = data["id"] as? String ?? ""
                        let username = data["username"] as? String ?? ""
                        let imageUsername = data["imageUsername"] as? String ?? ""
                        let dateValue = (data["date"] as AnyObject).dateValue()
                        let date = dateValue.timeAgoDisplay()
                        let textThread = data["textThread"] as? String ?? ""
                        let imageThread = data["imageThread"] as? String ?? ""
                        let like = data["like"] as? Bool ?? false
                        let likeCount = data["likeCount"] as? String ?? ""
                        let comment = data["comment"] as? String ?? ""
                        let commentCount = data["commentCount"] as? String ?? ""
                        let threadCount = data["threadCount"] as? String ?? ""
                        let viewCount = data["viewCount"] as? String ?? ""
                       
                        let thread = thread(id: id, username: username, imageUsername: imageUsername, date: date, textThread: textThread, imageThread: imageThread, like: like, likeCount: likeCount, comment: comment, commentCount: commentCount, threadCount: threadCount, viewCount: viewCount)
                        
                        self.threads.append(thread)
                    }
                }
            }
        }
    }
}

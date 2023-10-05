//
//  CommentViewModel.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 05/10/23.
//

import Foundation
import Firebase

final class CommentViewModel: ObservableObject{
    @Published var comments: [comment] = []
    @Published var commentThread = ""
    
    init(){
        fetchComment()
    }
    
    func fetchComment() {
        let db = Firestore.firestore()
        
        db.collection("Comment").getDocuments { querySnapshot, error in
            if let error = error {
                print("ERROR GETTING DOCUMENT : \(error.localizedDescription)")
            } else {
                if let querySnapshot = querySnapshot{
                    for document in querySnapshot.documents{
                        let data = document.data()
                        
                        let id = data["id"] as? String ?? ""
                        let username = data["username"] as? String ?? ""
                        let profilePic = data["profilePic"] as? String ?? ""
                        let commentThread = data["commentThread"] as? String ?? ""
                        
                        let comments = comment(id: id, username: username, profilePic: profilePic, commentThread: commentThread)
                        
                        self.comments.append(comments)
                    }
                }
            }
        }
    }
}

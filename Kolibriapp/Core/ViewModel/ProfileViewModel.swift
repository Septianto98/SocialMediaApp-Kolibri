//
//  ProfileViewModel.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 05/10/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ProfileViewModel: ObservableObject {
    
    @Published var threadProfile = [thread]()
    @Published var selectedFilter : ProfileButtonModel = .post
    
    init() {
        self.getDataProfile()
    }
    
    
    
    func getDataProfile(){
        let db = Firestore.firestore()
        let docRef = db.collection("Threads").document("4")

        // Force the SDK to fetch the document from the cache. Could also specify
        // FirestoreSource.server or FirestoreSource.default.
        docRef.getDocument(source: .cache) { (document, error) in
          if let document = document {
            let dataDescription = document.data()
            
              let id = dataDescription?["id"] as? String ?? ""
              let username = dataDescription?["username"] as? String ?? ""
              let imageUsername = dataDescription?["imageUsername"] as? String ?? ""
              let dateValue = (dataDescription?["date"] as AnyObject).dateValue()
              let date = dateValue.timeAgoDisplay()
              let textThread = dataDescription?["textThread"] as? String ?? ""
              let imageThread = dataDescription?["imageThread"] as? String ?? ""
              let like = dataDescription?["like"] as? Bool ?? false
              let likeCount = dataDescription?["likeCount"] as? String ?? ""
              let comment = dataDescription?["comment"] as? String ?? ""
              let commentCount = dataDescription?["commentCount"] as? String ?? ""
              let threadCount = dataDescription?["threadCount"] as? String ?? ""
              let viewCount = dataDescription?["viewCount"] as? String ?? ""
             
              let thread = thread(id: id, username: username, imageUsername: imageUsername, date: date, textThread: textThread, imageThread: imageThread, like: like, likeCount: likeCount, comment: comment, commentCount: commentCount, threadCount: threadCount, viewCount: viewCount)
              
              self.threadProfile.append(thread)
          } else {
            print("Document does not exist in cache")
          }
        }
    }
}

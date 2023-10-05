//
//  UserViewModel.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 03/10/23.
//

import Foundation
import Firebase

final class UserViewModel: ObservableObject{
    @Published var user: [users] = []
    
    init(){
        fetchUserData()
    }
    
    func fetchUserData() {
        let db = Firestore.firestore()
        
        db.collection("Users").getDocuments { querySnapshot, error in
            if let error = error {
                print("ERROR GETTING DOCUMENT : \(error)")
            } else {
                if let querySnapshot = querySnapshot{
                    for document in querySnapshot.documents{
                        let data = document.data()
                        
                        let id = data["id"] as? String ?? ""
                        let name = data["name"] as? String ?? ""
                        let profileImage = data["profileImage"] as? String ?? ""
                        let following = data["following"] as? String ?? ""
                        let followers = data["followers"] as? String ?? ""
                        let post = data["post"] as? String ?? ""
                        let bio = data["bio"] as? String ?? ""
                        
                        let users = users(id: id, name: name, profilImage: profileImage, following: following, followers: followers, post: post, bio: bio)
                        
                        self.user.append(users)
                    }
                }
            }
        }
    }
}

//
//  ProfileFilterViewModel.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 06/09/23.
//

import Foundation

enum ProfileButtonModel: Int, CaseIterable {
    case post
    case likes
    
    var title : String {
        switch self{
        case.post: return "Post"
        case.likes: return "Likes"
        }
    }
}

//
//  ThreadModel.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 03/10/23.
//

import Foundation

struct thread: Identifiable {
    var id: String
    var username: String
    var imageUsername: String
    var date: String
    var textThread: String
    var imageThread: String
    var like: Bool
    var likeCount: String
    var comment: String
    var commentCount: String
    var threadCount: String
    var viewCount: String
}

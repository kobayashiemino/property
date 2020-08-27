//
//  Models.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/27.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import Foundation

enum Gender {
    case men, female, other
}

struct User {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let birthday: Date
    let gender: Gender
    let count: UserCount
    let joinDate: Date
}

struct UserCount {
    let follower: Int
    let follws: Int
    let posts: Int
}

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImageURL: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createDate: Date
    let taggedUser: [String]
}

struct PostLike {
    let username: String
    let postIdentifier: String
}

struct CommentLike {
    let username: String
    let postIdentifier: String
}

struct PostComment {
    let useraame: String
    let text: String
    let createDate: Date
    let likes: [CommentLike]
}

//
//  StorageManeger.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/23.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import FirebaseStorage

public class StorageManeger {
    
    static let shared = StorageManeger()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManegerError: Error {
        case failedToDownload
    }
    
    // MARK: - Public
    
    public func uploadUserPhotoPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloarImage(with reference: String, completion: @escaping (Result<URL, IGStorageManegerError>) -> Void) {
        bucket.child(reference).downloadURL { (url, error) in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        }
    }
}

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let postType: UserPostType
}

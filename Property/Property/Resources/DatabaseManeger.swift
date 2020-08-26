//
//  DatabaseManeger.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/23.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import FirebaseDatabase

public class DataBaseManeger {
    static let shared = DataBaseManeger()
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void ) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { (error, _) in
            if error == nil {
                completion(true)
                return
            }
            else {
                completion(false)
            }
        }
    }
}

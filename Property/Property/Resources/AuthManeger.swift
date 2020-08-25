//
//  AuthManeger.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/23.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import FirebaseAuth

public class AuthManeger {
    static let shared = AuthManeger()
    
    // MARK: - public
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         check if username is available
         check if email is available
         */
        DataBaseManeger.shared.canCreateNewUser(with: email, username: username) { (canCreate) in
            if canCreate {
                /*
                 create account
                 insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                    guard error == nil, authResult != nil else {
                        // Firebase Auth does not create account
                        completion(false)
                        return
                    }
                }
                // insert into database
                DataBaseManeger.shared.insertNewUser(with: email, username: username) { (inserted) in
                    if inserted {
                        completion(true)
                        return
                    }
                    else {
                        completion(false)
                        return
                    }
                }
            }
            else {
                // either username or email does not exist
                completion(false)
            }
        }
    }
    
    // ??? @escaping：
    public func loginUser(username: String?, email: String?, password: String, completion : @escaping (Bool) -> Void ) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            print(username)
        }
    }
}

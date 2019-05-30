//
//  UserAPI.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/26/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import Firebase

class UserAPI {
    
    static let shared = UserAPI()
    
    private init() {}
    
    func loadUserInfo(with id: String, completion: @escaping (Result<UserProfile, Error>) -> () ) {
        Database.database().reference().child("customers").child(id).observe(.value) { (snap) in
            if !snap.exists() {
                return
            }
            print(snap.value!)
            let result = snap.value as! [String: AnyObject]
            let user = UserProfile(dictionary: result)
            completion(.success(user))
        }
    }
    
    func loadSentPackages(with id: String, completion: @escaping (Result<Package, Error>) -> () ) {
        Database.database().reference().child("sent").child(id).observe(.childAdded) { (snap) in
            let key = snap.key
            Database.database().reference().child("packages").child(key).observeSingleEvent(of: .value, with: { (package) in
                if let result = package.value as? [String: AnyObject] {
                    let package = Package(dictionary: result)
                    completion(.success(package))
                }
            })
        }
    }
    
    func loadReceivedPackages(with id: String, completion: @escaping (Result<Package, Error>) -> () ) {
        Database.database().reference().child("received").child(id).observe(.childAdded) { (snap) in
            let key = snap.key
            Database.database().reference().child("packages").child(key).observeSingleEvent(of: .value, with: { (package) in
                if let result = package.value as? [String: AnyObject] {
                    let package = Package(dictionary: result)
                    completion(.success(package))
                }
            })
        }
    }
    
}

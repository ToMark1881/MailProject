//
//  CourierAPI.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/26/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import Firebase

class CourierAPI {
    
    static let shared = CourierAPI()
    
    private init() {}
    
    func loadUserInfo(with id: String, completion: @escaping (Result<UserProfile, Error>) -> () ) {
        Database.database().reference().child("couriers").child(id).observe(.value) { (snap) in
            if !snap.exists() {
                return
            }
            let result = snap.value as! [String: AnyObject]
            let user = UserProfile(dictionary: result)
            completion(.success(user))
        }
    }
}

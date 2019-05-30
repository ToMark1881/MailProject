//
//  LoginAPI.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/25/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import Firebase

class AuthAPI {
    
    static let shared = AuthAPI()
    
    private init() {}
    
    
    func logIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> () ) {
        Auth.auth().signIn(withEmail: email, password: password) { (authInfo, err) in
            if let error = err {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            if let info = authInfo {
                completion(.success(info.user))
            }
        }
    }
    
    func getCurrentUser() -> User? {
        if let user = Auth.auth().currentUser {
            return user
        }
        else {
            return nil
        }
    }
    
    func logOut() {
        try! Auth.auth().signOut()
    }
    
}

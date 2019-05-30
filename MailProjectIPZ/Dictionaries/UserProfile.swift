//
//  User.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/26/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

class UserProfile {
    
    let name: String
    let email: String
    let phoneNumber: String
    let id: String
    
    init(dictionary: [String: AnyObject]) {
        self.name = dictionary["Name"] as! String
        self.email = dictionary["Email"] as! String
        self.phoneNumber = dictionary["Phone"] as! String
        self.id = dictionary["Id"] as! String
    }
    
}

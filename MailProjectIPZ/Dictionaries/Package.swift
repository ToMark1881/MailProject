//
//  Package.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/26/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

class Package {
    
    let address: String
    let city: String
    let courierId: String
    let deliveryStatus: String
    let description: String
    let id: String
    let packageId: String
    let paymentType: String
    let price: Int
    let receiverId: String
    let date: String
    let senderId: String
    let weight: Int
    
    init(dictionary: [String: AnyObject]) {
        self.address = dictionary["Address"] as! String
        self.city = dictionary["City"] as! String
        self.courierId = dictionary["CourierId"] as! String
        self.deliveryStatus = dictionary["DeliveryStatus"] as! String
        self.description = dictionary["Description"] as! String
        self.id = dictionary["Id"] as! String
        self.packageId = dictionary["PackageId"] as! String
        self.paymentType = dictionary["PaymentType"] as! String
        self.price = dictionary["Price"] as! Int
        self.receiverId = dictionary["ReceiverId"] as! String
        self.date = dictionary["RegistrationDate"] as! String
        self.senderId = dictionary["SenderId"] as! String
        self.weight = dictionary["Weight"] as! Int
    }
}

//
//  PackageVC.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/26/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import UIKit

class PackageVC: UIViewController {
    
    var package: Package? {
        didSet {
            loadSender()
            loadCourier()
            loadReceiver()
            setUpPackage()
        }
    }
    
    let usersInfoLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.text = "User's Info:"
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let receiverInfoLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "Receiver:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        return lbl
    }()
    
    let senderInfoLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "Sender:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let courierInfoLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "Courier:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let addressLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "Address:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "About:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "Date:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "Price:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let weightLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "Weight:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let statusLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -80, y: 0, width: 80, height: 18)
        subLbl.text = "Status:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setUpViews() {
        guard let topBar = self.navigationController?.navigationBar.frame else {return}
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.title = "Package"
        self.navigationController?.navigationBar.tintColor = UIColor.white

        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(white: 1, alpha: 1), .font: UIFont(name: Extentions.shared.boldFont, size: 16)!]
        self.view.addGradientBackground(firstColor: UIColor(red: 240/255, green: 11/255, blue: 81/255, alpha: 1), secondColor: UIColor(red: 119/255, green: 27/255, blue: 101/255, alpha: 1))
        
        usersInfoLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 150/2, y: topBar.maxY + 12, width: 150, height: 20)
        let line = UIView(frame: CGRect(x: 10, y: usersInfoLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width - 20, height: 1.5))
        line.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        senderInfoLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: line.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        receiverInfoLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: senderInfoLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        courierInfoLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: receiverInfoLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        
        let line2 = UIView(frame: CGRect(x: 10, y: courierInfoLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width - 20, height: 1.5))
        line2.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        addressLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: line2.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        descriptionLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: addressLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        dateLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: descriptionLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        priceLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: dateLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        weightLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: priceLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        statusLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 80, y: weightLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 80, height: 20)
        
        
        
        self.view.addSubviews(usersInfoLabel, receiverInfoLabel, courierInfoLabel, senderInfoLabel, line, line2, addressLabel, descriptionLabel, dateLabel, priceLabel, weightLabel, statusLabel)
    }
    
    fileprivate func setUpPackage() {
        guard let pack = package else {return}
        addressLabel.text = "\(pack.city) \(pack.address)"
        descriptionLabel.text = pack.description
        dateLabel.text = pack.date
        priceLabel.text = pack.price.description
        weightLabel.text = pack.weight.description
        statusLabel.text = pack.deliveryStatus
    }
    
    
    fileprivate func loadSender() {
        guard let pack = package else {return}
        let id = pack.senderId
        UserAPI.shared.loadUserInfo(with: id) { (result) in
            switch result {
            case .success(let user):
                self.senderInfoLabel.text = user.name
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    fileprivate func loadCourier() {
        guard let pack = package else {return}
        let id = pack.courierId
        CourierAPI.shared.loadUserInfo(with: id) { (result) in
            switch result {
            case .success(let user):
                self.courierInfoLabel.text = user.name
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    fileprivate func loadReceiver() {
        guard let pack = package else {return}
        let id = pack.receiverId
        UserAPI.shared.loadUserInfo(with: id) { (result) in
            switch result {
            case .success(let user):
                self.receiverInfoLabel.text = user.name
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

}

//
//  ViewController.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/8/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import UIKit

class UserVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userId: String? {
        didSet {
            loadUserInfo()
            loadPackages()
        }
    }
    let buttonBar = UIView()
    let responder = Responder()
    let cellId = "packageCell"
    
    var sentPackages = [Package]()
    var receivedPackages = [Package]()

    let nameLabel: UILabel = {
        let lbl = UILabel()
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -120, y: 0, width: 120, height: 18)
        subLbl.text = "Full Name:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let phoneNumberLabel: UILabel = {
        let lbl = UILabel()
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -120, y: 0, width: 120, height: 18)
        subLbl.text = "Phone Number:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let emailLabel: UILabel = {
        let lbl = UILabel()
        let subLbl = UILabel()
        subLbl.frame = CGRect(x: -120, y: 0, width: 120, height: 18)
        subLbl.text = "Email:"
        subLbl.textColor = UIColor.white
        subLbl.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        lbl.addSubview(subLbl)
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        return lbl
    }()
    
    let selectList: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Received", "Sent"])
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let packagesList: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 96
        tv.separatorStyle = .singleLine
        tv.separatorColor = UIColor.white
        tv.backgroundColor = UIColor.clear
        return tv
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectList.selectedSegmentIndex == 0 {
            return receivedPackages.count
        }
        else {
            return sentPackages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! PackageCell
        var package: Package?
        if selectList.selectedSegmentIndex == 0 {
            package = receivedPackages[indexPath.row]
        }
        else {
            package = sentPackages[indexPath.row]
        }
        if let pack = package  {
            cell.backgroundColor = UIColor.clear
            cell.desc.text = pack.description
            cell.address.text = "\(pack.city) \(pack.address)"
            cell.date.text = pack.date
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var package: Package?
        tableView.selectRow(at: nil, animated: true, scrollPosition: .none)
        if selectList.selectedSegmentIndex == 0 {
            package = receivedPackages[indexPath.row]
        }
        else {
            package = sentPackages[indexPath.row]
        }
        
        let vc = PackageVC()
        vc.package = package!
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        packagesList.delegate = self
        packagesList.dataSource = self
        setUpViews()
        packagesList.register(PackageCell.self, forCellReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setUpViews() {
        guard let topBar = self.navigationController?.navigationBar.frame else {return}
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.title = "Profile"
        let left = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOut))
        left.setTitleTextAttributes([.font : UIFont(name: Extentions.shared.lightFont, size: 16)!,
                                     .foregroundColor : UIColor(white: 1, alpha: 0.8)], for: .normal)
        let right = UIBarButtonItem(title: "Reload", style: .done, target: self, action: #selector(reload))
        right.setTitleTextAttributes([.font : UIFont(name: Extentions.shared.lightFont, size: 16)!,
                                      .foregroundColor : UIColor(white: 1, alpha: 0.8)], for: .normal)
        self.navigationItem.leftBarButtonItem = left
        self.navigationItem.rightBarButtonItem = right
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(white: 1, alpha: 1), .font: UIFont(name: Extentions.shared.boldFont, size: 16)!]
        self.view.addGradientBackground(firstColor: UIColor(red: 240/255, green: 11/255, blue: 81/255, alpha: 1), secondColor: UIColor(red: 119/255, green: 27/255, blue: 101/255, alpha: 1))
        
        nameLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 30, y: topBar.maxY + 12, width: Extentions.shared.screenSize.width/2 + 30, height: 18)
        emailLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 30, y: nameLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 30, height: 18)
        phoneNumberLabel.frame = CGRect(x: Extentions.shared.screenSize.width/2 - 30, y: emailLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width/2 + 30, height: 18)
        let line = UIView(frame: CGRect(x: 10, y: phoneNumberLabel.frame.maxY + 12, width: Extentions.shared.screenSize.width - 20, height: 1.5))
        line.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        selectList.frame = CGRect(x: 28, y: line.frame.maxY + 12, width: Extentions.shared.screenSize.width - 56, height: 30)
        setUpSegmentedControl()
        
        packagesList.frame = CGRect(x: 10, y: selectList.frame.maxY + 6, width: Extentions.shared.screenSize.width - 20, height: Extentions.shared.screenSize.height - (selectList.frame.maxY + 12))
        self.view.addSubviews(nameLabel, emailLabel, phoneNumberLabel, line, selectList, packagesList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chenkCurrentUser()
    }
    
    fileprivate func chenkCurrentUser() {
        let auth = AuthAPI.shared
        if userId == nil {
            let user = auth.getCurrentUser()
            if user == nil {
                self.navigationController?.present(LogInVC(), animated: true, completion: nil)
                return
            }
            else {
                userId = user?.uid
            }
        }
    }
    
    @objc fileprivate func logOut() {
        AuthAPI.shared.logOut()
        userId = nil
        chenkCurrentUser()
    }
    
    @objc fileprivate func reload() {
        sentPackages.removeAll()
        receivedPackages.removeAll()
        
        loadPackages()
    }
    
    fileprivate func loadUserInfo() {
        guard let id = userId else {return}
        UserAPI.shared.loadUserInfo(with: id) { (result) in
            switch result {
            case .failure(let err):
                print(err.localizedDescription)
            case .success(let user):
                self.setUpUserInfo(with: user)
            }
        }
    }
    
    fileprivate func loadPackages() {
        guard let id = userId else {return}
        UserAPI.shared.loadReceivedPackages(with: id) { (result) in
            switch result {
            case .success(let package):
                self.receivedPackages.append(package)
                DispatchQueue.main.async {
                    self.packagesList.reloadData()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
        UserAPI.shared.loadSentPackages(with: id) { (result) in
            switch result {
            case .success(let package):
                self.sentPackages.append(package)
                DispatchQueue.main.async {
                    self.packagesList.reloadData()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    fileprivate func setUpUserInfo(with user: UserProfile) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        phoneNumberLabel.text = user.phoneNumber
    }
    
    private func setUpSegmentedControl() {
        selectList.backgroundColor = .clear
        selectList.tintColor = .clear
        
        selectList.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: Extentions.shared.lightFont, size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)
        
        selectList.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: Extentions.shared.lightFont, size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
            ], for: .selected)
        selectList.addTarget(self, action: #selector(segmentedControlValueChanged), for:.valueChanged)
        
        buttonBar.backgroundColor = UIColor.white
        buttonBar.frame = CGRect(x: ((self.selectList.frame.width / CGFloat(self.selectList.numberOfSegments)) * CGFloat(self.selectList.selectedSegmentIndex)), y: selectList.frame.height + 3, width: (selectList.frame.width)/2 , height: 3)
        
        let backgroundButtonBar = UIView()
        backgroundButtonBar.backgroundColor = .lightGray
        backgroundButtonBar.frame = CGRect(x: buttonBar.frame.origin.x, y: buttonBar.frame.origin.y + 2, width: selectList.frame.width, height: 1)
        selectList.addSubview(backgroundButtonBar)
        selectList.addSubview(buttonBar)
        selectList.addTarget(responder, action: #selector(responder.segmentedControlValueChanged(_:)), for: UIControl.Event.valueChanged)
        
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.selectList.frame.width / CGFloat(self.selectList.numberOfSegments)) * CGFloat(self.selectList.selectedSegmentIndex)
        }
        
        DispatchQueue.main.async {
            self.packagesList.reloadData()
        }
    }
    
    

}


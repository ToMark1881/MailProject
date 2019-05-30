//
//  LogInVC.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/25/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font : UIFont(name: Extentions.shared.lightFont, size: 16)!
        ]
        tf.textColor = UIColor.white
        tf.autocorrectionType = .no
        tf.smartQuotesType = .no
        tf.smartDashesType = .no
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes:attributes)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: Extentions.shared.lightFont, size: 16)
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font : UIFont(name: Extentions.shared.lightFont, size: 16)!
        ]
        tf.textColor = UIColor.white
        tf.autocorrectionType = .default
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes:attributes)
        return tf
    }()
    
    let logInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(UIColor(red: 125/255, green: 119/255, blue: 255/255, alpha: 1), for: .normal)
        btn.backgroundColor = UIColor.white
        btn.titleLabel?.font = UIFont(name: Extentions.shared.boldFont, size: 16)
        btn.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        return btn
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        self.hideKeyboardWhenTappedAround()
    }
    
    fileprivate func setUpViews() {
        self.view.addGradientBackground(firstColor: UIColor(red: 255/255, green: 148/255, blue: 130/255, alpha: 1), secondColor: UIColor(red: 125/255, green: 119/255, blue: 255/255, alpha: 1))
        
        emailTextField.frame = CGRect(x: 30, y: Extentions.shared.screenSize.height/2 - 50, width: Extentions.shared.screenSize.width - 60, height: 45)
        passwordTextField.frame = CGRect(x: 30, y: emailTextField.frame.maxY + 12, width: Extentions.shared.screenSize.width - 60, height: 45)
        logInButton.frame = CGRect(x: 30, y: passwordTextField.frame.maxY + 42, width: Extentions.shared.screenSize.width - 60, height: 45)
        emailTextField.setBottomBorder()
        passwordTextField.setBottomBorder()
        logInButton.dropShadow()
        
        self.view.addSubviews(emailTextField, passwordTextField, logInButton)
        
    }
    
    @objc fileprivate func logIn() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        if !email.isEmpty && !password.isEmpty {
            AuthAPI.shared.logIn(email: email, password: password) { (result) in
                switch result {
                case .failure(let err):
                    print(err.localizedDescription)
                case .success(let user):
                    print(user.uid)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }

}

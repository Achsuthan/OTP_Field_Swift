//
//  ViewController.swift
//  OTP_Field_Swift
//
//  Created by achsum on 13/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    let lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "An OTP has been sent to Jerry@icloud.com"
        return label
    }()
    
    let lblDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Please enter the OTP within 15 Mins."
        return label
    }()
    
    let txtOTP: OTPField = {
        let txt = OTPField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    //MARK: - Setup UIs
    private func setUp(){
        
        self.view.addSubview(self.lblTitle)
        self.lblTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        self.lblTitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.lblTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        self.view.addSubview(self.lblDescription)
        self.lblDescription.topAnchor.constraint(equalTo: self.lblTitle.bottomAnchor, constant: 30).isActive = true
        self.lblDescription.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.lblDescription.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        
        self.view.backgroundColor = UIColor.systemBlue
        self.view.addSubview(self.txtOTP)
        self.txtOTP.topAnchor.constraint(equalTo: self.lblDescription.bottomAnchor, constant: 10).isActive = true
        self.txtOTP.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.txtOTP.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.txtOTP.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.txtOTP.setUpTxtField(5)
        self.txtOTP.otpDelegate = self
    }
}

extension ViewController: OTPComplete {
    func otpCompleted() {
        if self.txtOTP.text == ""{
            self.view.backgroundColor = UIColor.systemBlue
            self.txtOTP.setUpStatus(true)
        }
        else if self.txtOTP.text?.uppercased() != "ABCDE"{
            self.view.backgroundColor = UIColor(red: 1.00, green: 0.48, blue: 0.31, alpha: 1.00)
            self.txtOTP.setUpStatus(false)
        }
        else {
            self.view.backgroundColor = UIColor.systemBlue
            self.txtOTP.setUpStatus(true)
        }
    }
}


//
//  OTPField.swift
//  OTP_Field_Swift
//
//  Created by achsum on 13/12/20.
//

protocol OTPComplete {
    func otpCompleted()
}

import UIKit

class OTPField: UITextField {
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var otpTxtField: [TextField] = []
    var otpValues:[String] = []
    var totalTxtField: Int = 3
    var otpDelegate: OTPComplete?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(self.txtChanged(_:)), for: .editingChanged)
        self.textColor = .clear
        self.tintColor = .clear
        self.autocorrectionType = .no
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetUP UIs
    private func setUp(){
        self.addSubview(self.stackView)
        self.stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    //MARK:- Add txtfield to StackView
    @objc func setUpTxtField(_ count: Int = 3){
        self.totalTxtField = count
        self.stackView.axis = .horizontal
        self.stackView.distribution = .fillEqually
        self.stackView.spacing = 10
        
        for _ in 0..<count {
            let txtTmp = TextField()
            txtTmp.translatesAutoresizingMaskIntoConstraints = false
            let tmpTouch = UITapGestureRecognizer(target: self, action: #selector(self.labelTaped(_:)))
            tmpTouch.numberOfTapsRequired = 1 // Default value
            txtTmp.isUserInteractionEnabled = true
            txtTmp.addGestureRecognizer(tmpTouch)
            self.stackView.addArrangedSubview(txtTmp)
            self.otpTxtField.append(txtTmp)
        }
    }
    
    //MARK:- SetUpTextFieldStatus
    func setUpStatus(_ type: Bool = false){
        //Success
        if type {
            for val in self.otpTxtField {
                val.lblLabl.textColor = .black
            }
        }
        //Fail
        else {
            for val in self.otpTxtField {
                val.lblLabl.textColor = .systemRed
            }
        }
    }
    
    @IBAction func labelTaped(_: Any){
        self.becomeFirstResponder()
    }
    
    @IBAction func txtChanged(_ txt: UITextField){
        guard let textString = txt.text?.uppercased() else {
            return
        }
        if textString == "" {
            for i in 0..<otpTxtField.count{
                self.otpTxtField[i].lblLabl.text = ""
            }
            self.otpDelegate?.otpCompleted()
        }
        else if textString.count > self.otpTxtField.count {
            let index = textString.index(textString.startIndex, offsetBy: self.otpTxtField.count)
            self.text = String(textString[..<index])
        }
        else {
            for i in 0..<otpTxtField.count {
                let tmp = otpTxtField[i]
                if i < textString.count {
                    let index = textString.index(textString.startIndex, offsetBy: i)
                    tmp.lblLabl.text = String(textString[index])
                }
                else {
                    tmp.lblLabl.text = ""
                }
            }
            if self.otpTxtField.count == textString.count {
                self.otpDelegate?.otpCompleted()
            }
        }
    }
}

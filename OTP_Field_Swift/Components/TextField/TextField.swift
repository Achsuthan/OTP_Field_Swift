//
//  TextField.swift
//  OTP_Field_Swift
//
//  Created by achsum on 13/12/20.
//

import UIKit

class TextField: UIView {
    
    let lblLabl: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetUp UIs
    private func setUp(){
        
        self.addSubview(self.lblLabl)
        self.lblLabl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.lblLabl.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.lblLabl.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.lblLabl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    //MARIK:
}

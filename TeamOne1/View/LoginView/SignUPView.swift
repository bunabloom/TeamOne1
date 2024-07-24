//
//  SignUPView.swift
//  TeamOne1
//
//  Created by bloom on 7/23/24.
//

import UIKit
import SnapKit

class SignUPView: UIView {
  
  private let titleLabel: UILabel = {
      let label = UILabel()
      label.text = "회원 가입"
      label.font = UIFont.boldSystemFont(ofSize: 24)
      label.textAlignment = .center
      return label
  }()
  
  let usernameTextField: UITextField = {
      let textField = UITextField()
      textField.placeholder = "이름"
      textField.borderStyle = .roundedRect
      return textField
  }()
  
  let userbirthTextField: UITextField = {
      let textField = UITextField()
      textField.placeholder = "생년월일"
      textField.borderStyle = .roundedRect
      return textField
  }()
  
  let useridTextField: UITextField = {
      let textField = UITextField()
      textField.placeholder = "ID"
      textField.borderStyle = .roundedRect
      return textField
  }()

  let passwordTextField: UITextField = {
      let textField = UITextField()
      textField.placeholder = "PW"
      textField.borderStyle = .roundedRect
      return textField
  }()

  

 lazy var signupButton: UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("Sign Up", for: .normal)
      button.backgroundColor = .systemBlue
      button.setTitleColor(.white, for: .normal)
      button.layer.cornerRadius = 5

      return button
  }()

   lazy var cancelButton: UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("Cancel", for: .normal)
      
      return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
      
      self.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 208/255, alpha: 1.0)
    
    [
      titleLabel,
      usernameTextField,
      userbirthTextField,
      useridTextField,
      passwordTextField,
      signupButton,
      cancelButton
    ].forEach{addSubview($0)}
    

    
    titleLabel.snp.makeConstraints{
      $0.top.equalTo(safeAreaLayoutGuide).offset(20)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.width.equalTo(300)
      $0.height.equalTo(40)
    }

    usernameTextField.snp.makeConstraints{
      
      $0.top.equalTo(titleLabel.snp.bottom).offset(50)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.width.equalTo(300)
      $0.height.equalTo(40)
    }
    userbirthTextField.snp.makeConstraints{
      $0.top.equalTo(usernameTextField.snp.bottom).offset(20)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.width.equalTo(300)
      $0.height.equalTo(40)
    }
    useridTextField.snp.makeConstraints{
      $0.top.equalTo(userbirthTextField.snp.bottom).offset(20)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.width.equalTo(300)
      $0.height.equalTo(40)
    }
    passwordTextField.snp.makeConstraints{
      $0.top.equalTo(useridTextField.snp.bottom).offset(20)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.width.equalTo(300)
      $0.height.equalTo(40)
    }
    signupButton.snp.makeConstraints{
      $0.top.equalTo(passwordTextField.snp.bottom).offset(50)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.width.equalTo(120)
      $0.height.equalTo(40)
    }
    cancelButton.snp.makeConstraints{
      $0.top.equalTo(signupButton.snp.bottom).offset(50)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.width.equalTo(120)
      $0.height.equalTo(40)
    }
    
  }
}

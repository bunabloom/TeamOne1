//
//  SignupViewController.swift
//  TeamOne1
//
//  Created by 내꺼다 on 7/22/24.
//

import UIKit
import SnapKit

class SignupViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "회원 가입"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let userbirthTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "생년월일"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let useridTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ID"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "PW"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()

    

    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        return button
    }()

    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 208/255, alpha: 1.0)

        [titleLabel, usernameTextField, userbirthTextField, useridTextField, passwordTextField, signupButton, cancelButton]
                    .forEach { view.addSubview($0) }
        

        setupLayout()
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        usernameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        userbirthTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(usernameTextField.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        useridTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userbirthTextField.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(useridTextField.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        signupButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signupButton.snp.bottom).offset(10)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }
    }

    @objc private func signupTapped() {
        // 유효성검사 해야 함
        guard let username = usernameTextField.text, !username.isEmpty,
              let userbirth = userbirthTextField.text, !userbirth.isEmpty,
              let userid = useridTextField.text, !userid.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // 유효성 검사 실패
            print("모든 필드를 채워주세요.")
            return
        }
        // UserDefaults에 정보 저장
        UserDefaults.standard.set(userid, forKey: "userid")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(userbirth, forKey: "userbirth")
        UserDefaults.standard.synchronize()
        
        print("회원 가입 완료")

        dismiss(animated: true, completion: nil)
    }

    @objc private func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
}

//
//  SignupViewController.swift
//  TeamOne1
//
//  Created by 내꺼다 on 7/22/24.
//

import UIKit

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
        view.backgroundColor = .white

        view.addSubview(titleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(userbirthTextField)
        view.addSubview(useridTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signupButton)
        view.addSubview(cancelButton)

        setupLayout()
    }

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        userbirthTextField.translatesAutoresizingMaskIntoConstraints = false
        useridTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            userbirthTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userbirthTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            userbirthTextField.widthAnchor.constraint(equalToConstant: 300),
            userbirthTextField.heightAnchor.constraint(equalToConstant: 40),
            
            useridTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            useridTextField.topAnchor.constraint(equalTo: userbirthTextField.bottomAnchor, constant: 20),
            useridTextField.widthAnchor.constraint(equalToConstant: 300),
            useridTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: useridTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

       
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signupButton.widthAnchor.constraint(equalToConstant: 120),
            signupButton.heightAnchor.constraint(equalToConstant: 40),

            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: 120),
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func signupTapped() {
        // 유효성검사 해야 함
    }

    @objc private func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
}

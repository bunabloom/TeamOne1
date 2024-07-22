//
//  ViewController.swift
//  TeamOne1
//
//  Created by bloom on 7/22/24.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

  let movieview = MovieDetailView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 208/255, alpha: 1.0)

    view.addSubview(idTextField)
    view.addSubview(pwTextField)
    view.addSubview(loginButton)
    view.addSubview(signupButton)

    setupLayout()
    
    
    // Do any additional setup after loading the view.
  }

    
    // 로고 이미지 넣기
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "id"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "pw"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(red: 53/255, green: 114/255, blue: 239/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()

    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor(red: 53/255, green: 114/255, blue: 239/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        return button
    }()




    private func setupLayout() {
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            idTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            idTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            idTextField.widthAnchor.constraint(equalToConstant: 300),
            idTextField.heightAnchor.constraint(equalToConstant: 40),

            pwTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
            pwTextField.widthAnchor.constraint(equalToConstant: 300),
            pwTextField.heightAnchor.constraint(equalToConstant: 40),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 40),

            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            signupButton.widthAnchor.constraint(equalToConstant: 120),
            signupButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func loginTapped() {
        // 로그인 로직 구현
        
    }

    @objc private func signupTapped() {
        let signupViewController = SignupViewController()
        signupViewController.modalPresentationStyle = .fullScreen
        present(signupViewController, animated: true, completion: nil)
    }
}

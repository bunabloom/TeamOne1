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

      
    [logoImageView, idTextField, pwTextField, loginButton, signupButton]
                  .forEach { view.addSubview($0) }

    setupLayout()
    
    
    // Do any additional setup after loading the view.
  }

    
    // 로고 이미지 넣기
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
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
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(10)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        pwTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }

        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwTextField.snp.bottom).offset(40)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }
        
        signupButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }

    }

    @objc private func loginTapped() {
        // 로그인 로직 구현
        if let savedUserId = UserDefaults.standard.string(forKey: "userid"),
           let savedPassword = UserDefaults.standard.string(forKey: "password"),
           savedUserId == idTextField.text,
           savedPassword == pwTextField.text {
            // 메인 화면으로 넘어가야 함
        }
    }

    @objc private func signupTapped() {
        let signupViewController = SignupViewController()
        signupViewController.modalPresentationStyle = .fullScreen
        present(signupViewController, animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  TeamOne1
//
//  Created by bloom on 7/22/24.
//

import UIKit
import SnapKit
class LoginViewController: UIViewController {

  
  let loginView = LoginView()
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureAddTarget()

    view.addSubview(loginView)
    loginView.snp.makeConstraints{
      $0.edges.equalToSuperview()
    }
    
    
    // Do any additional setup after loading the view.
  }

    
    // 로고 이미지 넣기
    
    
  
  func configureAddTarget(){
    loginView.signupButton.addTarget(self, action: #selector(signupTapped), for: .touchDown)
    loginView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchDown)
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

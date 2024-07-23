//
//  SignupViewController.swift
//  TeamOne1
//
//  Created by 내꺼다 on 7/22/24.
//

import UIKit
import SnapKit

final class SignupViewController: UIViewController {
  let signUpView = SignUPView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureBasic()
    
    
    
  }
  final private func configureBasic(){
    view.addSubview(signUpView)
    signUpView.snp.makeConstraints{
      $0.edges.equalToSuperview()
    }
    signUpView.cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
    signUpView.signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
  }
  
  
  
  
  @objc private func signupTapped() {
    // 유효성검사 해야 함
  }
  
  @objc private func cancelTapped() {
    dismiss(animated: true, completion: nil)
  }
}

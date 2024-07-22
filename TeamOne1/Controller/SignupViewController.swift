//
//  SignupViewController.swift
//  TeamOne1
//
//  Created by 내꺼다 on 7/22/24.
//

import UIKit
import SnapKit

class SignupViewController: UIViewController, ConstraintRelatableTarget {
  let signUpView = SignUPView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureBasic()
    
    
    
  }
  func configureBasic(){
    view.addSubview(signUpView)
    signUpView.snp.makeConstraints{
      $0.edges.equalToSuperview()
    }
  }
  
  
  
  
  @objc private func signupTapped() {
    // 유효성검사 해야 함
  }
  
  @objc private func cancelTapped() {
    dismiss(animated: true, completion: nil)
  }
}

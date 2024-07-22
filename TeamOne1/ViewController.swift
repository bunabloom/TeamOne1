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
    view.backgroundColor = .white
    view.addSubview(movieview)
    movieview.snp.makeConstraints{
      $0.edges.equalToSuperview()
    }
    
    
    // Do any additional setup after loading the view.
  }


}


//
//  MovieListView.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.
//

import UIKit
import SnapKit

class MovieListView: UIView {
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "영화"
        lb.textColor = .black
        lb.font = .boldSystemFont(ofSize: 35)
        lb.textAlignment = .center
        return lb
    }()
    
    private let welcomeUser: UILabel = {
        let lb = UILabel()
        lb.text = "돌아오신것을 환영합니다!"
        lb.textAlignment = .right
        lb.textColor = .black
        lb.font = .boldSystemFont(ofSize: 13)
        return lb
    }()
    
    lazy var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 제약조건 추가
    private func configureUI() {
        
        self.backgroundColor = .white
        [
            titleLabel,
            welcomeUser,
            tableView ].forEach{ addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(53)
            $0.centerX.equalToSuperview()
            
        }
        
        welcomeUser.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(welcomeUser.snp.bottom).offset(80)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}

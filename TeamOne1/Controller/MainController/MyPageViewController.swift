//
//  MyPageViewController.swift
//  TeamOne1
//
//  Created by 내꺼다 on 7/25/24.
//

import UIKit
import SnapKit

final class MyPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // 사용자 프로필 이미지 뷰
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.image = UIImage(named: "profileimage")
        return imageView
    }()

    // 사용자 id 라벨
    let idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NanumSquareNeo-dEb", size: 24)
        label.textAlignment = .left
        return label
    }()

    let helloLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NanumSquareNeo-cBd", size: 18)
        label.textAlignment = .left
        label.text = "안녕하세요."
        return label
    }()
    
    let userInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NanumSquareNeo-bRg", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let userInfoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NanumSquareNeo-dEb", size: 20)
        label.text = "내 정보"
        return label
    }()
    
    let bookingHistoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NanumSquareNeo-dEb", size: 20)
        label.text = "영화 예매 내역"
        return label
    }()

    // 로그아웃 버튼
    lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "NanumSquareNeo-dEb", size: 16)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 컬렉션 뷰 레이아웃 설정
    let collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 200, height: 250)
        return layout
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyPageCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    var bookingHistory = [[String: Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // 수직 스택 뷰 설정
        let verticalStackView = UIStackView(arrangedSubviews: [idLabel, helloLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        verticalStackView.alignment = .leading

        // 수평 스택 뷰 설정
        let horizontalStackView = UIStackView(arrangedSubviews: [verticalStackView, profileImageView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.alignment = .center

        // 서브뷰 추가
        view.addSubview(horizontalStackView)
        view.addSubview(userInfoTitleLabel)
        view.addSubview(userInfoLabel)
        view.addSubview(bookingHistoryTitleLabel)
        view.addSubview(collectionView)
        view.addSubview(logoutButton)

        // 레이아웃 설정
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.trailing.equalToSuperview().inset(30)
        }

        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }

        userInfoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalStackView.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(30)
        }

        userInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
        }

        bookingHistoryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(30)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(bookingHistoryTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(250)
        }

        logoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }

        // 로그인한 사용자 정보 로드
        loadUserInfo()
        
        // 예매 내역 로드
        loadBookingHistory()
    }

    func loadUserInfo() {
      
      if let usermovie = UserDefaults.standard.string(forKey: "movie"){
        }
      
        if let userid = UserDefaults.standard.string(forKey: "loggedInUserID"),
           let userDict = UserDefaults.standard.dictionary(forKey: userid) as? [String: String] {
            idLabel.text = "\(userDict["userid"] ?? "아이디")님"
            userInfoLabel.text = """
            이름: \(userDict["username"] ?? "")
            생년월일: \(userDict["userbirth"] ?? "")
            """
          
        }
    }
    
    func loadBookingHistory() {
        if let allReservations = reservationModel.loadReservationsFromUserDefaults(key: "allReservations") {
            bookingHistory = allReservations
            collectionView.reloadData()
        }
    }

    @objc func logoutButtonTapped() {
        // 로그아웃 처리: 사용자 데이터 초기화, 로그인 화면으로 전환 등
        UserDefaults.standard.removeObject(forKey: "loggedInUserID")
        
        // 네비게이션 스택 초기화하고 루트뷰컨으로 돌아가기
        navigationController?.popToRootViewController(animated: true)
    }

    // 컬렉션 뷰 데이터 소스 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookingHistory.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyPageCollectionViewCell
        
        let bookingData = bookingHistory[indexPath.item]
        cell.configure2(temp: bookingData)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
  

  

}

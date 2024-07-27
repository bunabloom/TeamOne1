//
//  BookingViewController.swift
//  TeamOne1
//
//  Created by 김동준 on 7/25/24.
//

import UIKit
import SnapKit

class ReservationViewController: UIViewController {
  var sss: MovieDetailViewController?
    var numberCount: Int = 1
    var price: Int = 14000
    var saveDate: String?
  
    // 날짜
    let setDate: UIPickerView = {
        let pkv = UIPickerView()
        return pkv
    }()
    // 영화 상영시간이 들어갈 스택뷰
    let timeStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 5
        sv.alignment = .center
        sv.backgroundColor = .white
        sv.distribution = .fillEqually
        return sv
    }()
    
    // 영화 인원수 라벨
    let peopleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "몇명이얌?"
        lb.textColor = .black
        lb.textAlignment = .left
        lb.font = .boldSystemFont(ofSize: 25)
        return lb
    }()
    
    // 티켓 구매자 인원
    let peopleCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        label.backgroundColor = .white
        return label
    }()
    
    // 마이너스 버튼
    lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle(" - ", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchDown)
        return button
    }()
    
    // 플러스 버튼
    lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle(" + ", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchDown)
        return button
    }()
    
    // 영화 가격
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "14000원"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        label.backgroundColor = .white
        return label
    }()
    
    // 결제하기 버튼
    lazy var payButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemGray
        config.baseForegroundColor = .blue
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 120, bottom: 10, trailing: 120)
        
        let button = UIButton(type: .system)
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
      button.setTitleColor(.red, for: .selected)
        button.frame.size = CGSize.init(width: 150, height: 60)
      button.configuration = .plain()
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pressPayButton), for: .touchUpInside)
        return button
    }()
    
    // pickerView 안에 들어갈 날짜 더미데이터
    var 날짜 = ["2024.07.26", "2024.07.27", "2024.07.27", "2024.07.28", "2024.07.29"]
    // 영화 시간 버튼 설정
    var buttons: [String] = ["오전 10: 35", "오후 04: 45", "오후 06: 10", "오후 07: 55", "오후 12: 11"]
//    let buttons: [String] = ["오전 10: 20", "오전 10: 20", "오전 10: 20", "오전 10: 20", "오전 10: 20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
      let temp = UserDefaults.standard.string(forKey: userid)
//      for (a,b) in temp {
//        print(a,b)
//      }
      print(temp,#function)
        setDate.delegate = self
        setDate.dataSource = self
        setDate.backgroundColor = .white
        
    }
    
    func setupUI() {
        [setDate, timeStackView, peopleLabel, increaseButton, peopleCountLabel, decreaseButton, priceLabel, payButton].forEach { view.addSubview($0) }
        
        setDate.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(200)
        }
        
        timeStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(setDate.snp.trailing).inset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(200)
        }
        
        peopleLabel.snp.makeConstraints {
            $0.top.equalTo(setDate.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(25)
        }
        
        increaseButton.snp.makeConstraints {
            $0.top.equalTo(setDate.snp.bottom).offset(30)
            $0.leading.equalTo(peopleCountLabel.snp.trailing).offset(10)
            $0.height.equalTo(25)
        }
        
        peopleCountLabel.snp.makeConstraints {
            $0.top.equalTo(setDate.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().inset(70)
            $0.width.equalTo(60)
            $0.height.equalTo(25)
        }
        
        decreaseButton.snp.makeConstraints {
            $0.top.equalTo(setDate.snp.bottom).offset(30)
            $0.trailing.equalTo(peopleCountLabel.snp.leading).offset(-10)
            $0.height.equalTo(25)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(peopleCountLabel.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        payButton.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        
        
        // 버튼을 스택뷰에 추가
        for buttonTitle in buttons {
            let button = createButton(title: buttonTitle)
            timeStackView.addArrangedSubview(button)
        }
    }
    
    // 영화 상영시간을 고를수 있는 버튼들을 생성하는 메서드
    private func createButton(title: String) -> UIButton {
//        var config = UIButton.Configuration.filled()
//        config.baseBackgroundColor = .systemGray
//        config.baseForegroundColor = .white
//        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
//        button.configuration = config
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }
    
    // 상영시간 버튼을 눌렀을 때의 액션 버튼
    @objc private func tappedButton() {
       
    }
    
    @objc
    private func minusButtonTapped() {
        if self.numberCount > 1 {
            self.numberCount -= 1
            peopleCountLabel.text = "\(numberCount)"
            
            self.price -= 14000
            priceLabel.text = "\(price)원"
        }
    }
    
    @objc
        private func plusButtonTapped() {
            self.numberCount += 1
            peopleCountLabel.text = "\(numberCount)"
            
            self.price += 14000
            priceLabel.text = "\(price)원"
            
    }
    
    // 경고메세지 출력
    @objc private func pressPayButton() {
      
      print(#function,"movie id:\(resevationModel.reservationMovie)")
        let confirmAlert = UIAlertController(title: "결제 확인", message: "정말로 결제하시겠습니까?", preferredStyle: .alert)
        confirmAlert.addAction(UIAlertAction(title: "결제", style: .default, handler: { _ in
            self.showPaymentCompletedAlert()
        }))
        confirmAlert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.present(confirmAlert, animated: true, completion: nil)
    }
    
    // 결제완료 메세지 출력
    private func showPaymentCompletedAlert() {
        let completedAlert = UIAlertController(title: "이런!", message: "잔액이 부족합니다.", preferredStyle: .alert)
        completedAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(completedAlert,animated: true, completion: nil)
      
      guard let saveDate = saveDate else { return }
      
      let info = temp(date: saveDate, time: "10:20", people: numberCount, price: numberCount * 14000 )
      
      UserDefaults.standard.set("\(resevationModel.reservationMovie)", forKey: "movie")
      
      UserDefaults.standard.setValue("\(info)",forKey:"ticketingInfo")
      
      
      
      if let ticketinginfo = UserDefaults.standard.string(forKey: "ticketingInfo")
      {print("####",ticketinginfo)}
      
      //하고 ui 만 단정하게 -> 내일하져
      
      /* 일단 화면이 전환되도 id값을 고유로 가질수 있게끔 하였으나
       userdefaults에 저장이 안됨
       -> 저장 이 되면 문제 끝
       */
    }
    
}
    
    extension ReservationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return 날짜.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          saveDate = 날짜[row]
          return 날짜[row]
        }
    }
    

           

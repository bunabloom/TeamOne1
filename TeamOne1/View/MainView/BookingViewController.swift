//
//  BookingViewController.swift
//  TeamOne1
//
//  Created by 김동준 on 7/25/24.
//

import UIKit

class BookingViewController: UIViewController {
    
    
    var numberCount: Int = 1

    // UI 요소들 정의
    let reserveLabel: UILabel = {
        let label = UILabel()
        label.text = "예매하기"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        return label
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "영화명"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "블랙 위도우"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "날짜"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("8/21/21", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let timeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("10:31 PM", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let peopleLabel: UILabel = {
        let label = UILabel()
        label.text = "인원"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let peopleCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let decreaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchDown)
        return button
    }()
    
    let increaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchDown)
        return button
    }()
    
    let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "총 가격"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "5000 원"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("결제하기", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews() {
        view.addSubview(reserveLabel)
        view.addSubview(movieTitleLabel)
        view.addSubview(movieNameLabel)
        view.addSubview(dateLabel)
        view.addSubview(dateButton)
        view.addSubview(timeButton)
        view.addSubview(peopleLabel)
        view.addSubview(peopleCountLabel)
        view.addSubview(decreaseButton)
        view.addSubview(increaseButton)
        view.addSubview(totalPriceLabel)
        view.addSubview(priceLabel)
        view.addSubview(payButton)
        
        NSLayoutConstraint.activate([
            reserveLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            reserveLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            movieTitleLabel.topAnchor.constraint(equalTo: reserveLabel.bottomAnchor, constant: 200),
            movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            movieNameLabel.topAnchor.constraint(equalTo: movieTitleLabel.topAnchor),
            movieNameLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor, constant: 205),
            
            
            dateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 100),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            dateButton.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            dateButton.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 170),
            
            timeButton.centerYAnchor.constraint(equalTo: dateButton.centerYAnchor),
            timeButton.leadingAnchor.constraint(equalTo: dateButton.trailingAnchor, constant: 20),
            
            peopleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 100),
            peopleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            peopleCountLabel.topAnchor.constraint(equalTo: peopleLabel.topAnchor),
            peopleCountLabel.leadingAnchor.constraint(equalTo: peopleLabel.trailingAnchor, constant: 200),
            
            decreaseButton.centerYAnchor.constraint(equalTo: peopleCountLabel.centerYAnchor),
            decreaseButton.leadingAnchor.constraint(equalTo: peopleCountLabel.trailingAnchor, constant: 20),
            
            increaseButton.centerYAnchor.constraint(equalTo: decreaseButton.centerYAnchor),
            increaseButton.leadingAnchor.constraint(equalTo: decreaseButton.trailingAnchor, constant: 20),
            
            totalPriceLabel.topAnchor.constraint(equalTo: peopleLabel.bottomAnchor, constant: 100),
            totalPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: totalPriceLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: totalPriceLabel.trailingAnchor, constant: 215),
            
            payButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            payButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
        setupViews()
    }
    @objc
        private func minusButtonTapped() {
            self.numberCount -= 1
            peopleCountLabel.text = "\(numberCount)"
        }
        
    @objc
        private func plusButtonTapped() {
            self.numberCount += 1
            peopleCountLabel.text = "\(numberCount)"
    }
}

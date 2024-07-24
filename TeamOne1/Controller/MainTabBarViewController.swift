//
//  MainTabBarViewController.swift
//  TeamOne1
//
//  Created by 내꺼다 on 7/24/24.
//

import UIKit
import SnapKit


class MainTabBarViewController: UIViewController {

    private let customTabBar = UITabBar()
    private var viewControllers: [UIViewController] = []
    private let selectionIndicator = UIView()  // 인디케이터 뷰
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupCustomTabBar()
        setupConstraints()
        setupSelectionIndicator()
        selectViewController(at: 0) // 첫번째 탭 기본설정
    }

    private func setupViewControllers() {
        let movieListVC = MovieListViewController()
        let searchVC = UIViewController()
        let myPageVC = UIViewController()

        movieListVC.tabBarItem = UITabBarItem(title: "영화 목록", image: nil, tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "영화 검색", image: nil, tag: 1)
        myPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: nil, tag: 2)
        
        viewControllers = [movieListVC, searchVC, myPageVC]
    }

    private func setupCustomTabBar() {
        customTabBar.items = viewControllers.map { $0.tabBarItem }
        customTabBar.selectedItem = customTabBar.items?.first
        customTabBar.delegate = self
        customTabBar.tintColor = .blue
        customTabBar.unselectedItemTintColor = .gray
        customTabBar.clipsToBounds = true
        customTabBar.backgroundColor = .white

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.blue
        ]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
        
        let positionAdjustment = UIOffset(horizontal: 0, vertical: -25) // 수직 위치 조정
        UITabBarItem.appearance().titlePositionAdjustment = positionAdjustment
        
        view.addSubview(customTabBar)
    }

    private func setupConstraints() {
        customTabBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(70)
        }
    }
    
    private func setupSelectionIndicator() {
        selectionIndicator.backgroundColor = .blue
        selectionIndicator.clipsToBounds = true
        
        customTabBar.addSubview(selectionIndicator)
        
        updateSelectionIndicatorPosition()
    }

    private func updateSelectionIndicatorPosition() {
        guard let selectedItem = customTabBar.selectedItem, let index = customTabBar.items?.firstIndex(of: selectedItem) else {
            return
        }
        
        let tabBarWidth = customTabBar.bounds.width
        let itemWidth = tabBarWidth / CGFloat(customTabBar.items!.count)
        let xPosition = itemWidth * CGFloat(index) // x좌표계산해서 밑줄위치 배치
        
        selectionIndicator.snp.remakeConstraints {
            $0.bottom.equalTo(customTabBar.snp.bottom) // TabBar의 bottom에 맞추기
            $0.height.equalTo(3) // Indicator의 높이
            $0.leading.equalTo(customTabBar.snp.leading).offset(xPosition)
            $0.width.equalTo(itemWidth)
        }
        view.layoutIfNeeded()
    }

    // 인덱스에 해당하는 탭바 항목 뷰컨 화면에 표시하고 나머지 항목 뷰컨 숨기기(부모뷰 하위뷰)
    private func selectViewController(at index: Int) {
        for (i, vc) in viewControllers.enumerated() {
            if i == index {
                addChild(vc)
                vc.view.frame = view.bounds
                view.insertSubview(vc.view, belowSubview: customTabBar)
                vc.didMove(toParent: self)
            } else {
                vc.willMove(toParent: nil)
                vc.view.removeFromSuperview()
                vc.removeFromParent()
            }
        }
        customTabBar.selectedItem = customTabBar.items?[index]
        updateSelectionIndicatorPosition()
    }
}


extension MainTabBarViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            selectViewController(at: index)
        }
    }
}



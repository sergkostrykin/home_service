//
//  MainViewController.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 23.05.2022.
//

import UIKit

class MainViewController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
}


private extension MainViewController {
    
    enum Tab: Int, CaseIterable {
        case home, event
    }

    func setupControllers() {
        
        var controllers = [UIViewController]()
        
        for tab in Tab.allCases {
            var controller: UIViewController
            
            switch tab {
            case .home:
                controller = HomeViewController()
                controller.tabBarItem = UITabBarItem(title: R.string.localizable.tabHome(),
                                                     image: .home,
                                                     selectedImage: .homeFilled)
            case .event:
                controller = EventViewController()
                controller.tabBarItem = UITabBarItem(title: R.string.localizable.tabEvents(),
                                                     image: .events,
                                                     selectedImage: .eventsFilled)
            }
            controllers.append(controller)
        }
        self.viewControllers = controllers
        self.tabBar.tintColor = .systemBlue

    }
}

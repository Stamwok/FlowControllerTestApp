//
//  CabinetFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 9.05.22.
//

import UIKit

class CabinetFlowController: UITabBarController, UITabBarControllerDelegate {
    
    private let dependencyContainer: DependencyContainer

    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        self.delegate = self
        self.tabBar.layer.borderWidth = 0.50
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.clipsToBounds = true
        let loginFlowController = LoginFlowController(dependencyContainer: dependencyContainer)
        loginFlowController.tabBarItem = UITabBarItem.init(title: "Login", image: UIImage(systemName: "circle.fill"), tag: 0)
        let logoutFlowController = LogoutFlowController(dependencyContainer: dependencyContainer)
        logoutFlowController.tabBarItem = UITabBarItem.init(title: "Logout", image: UIImage(systemName: "square.fill"), tag: 1)
        self.viewControllers = [loginFlowController, logoutFlowController]
    }
}

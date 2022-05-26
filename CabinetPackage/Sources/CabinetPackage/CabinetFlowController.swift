//
//  CabinetFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 9.05.22.
//

import UIKit
import ModelPackage
import LoginPackage
import LogoutPackage

public class CabinetFlowController: UITabBarController, UITabBarControllerDelegate {
    
    private let dependencyContainer: DependencyContainer
    public var cabinetFlowDidFinish: (() -> Void)?

    public init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func start() {
        self.delegate = self
        self.tabBar.layer.borderWidth = 0.50
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.clipsToBounds = true
        let loginFlowController = LoginFlowController(dependencyContainer: dependencyContainer)
        if #available(iOS 13.0, *) {
            loginFlowController.tabBarItem = UITabBarItem.init(title: "Login", image: UIImage(systemName: "circle.fill"), tag: 0)
        } else {
            // Fallback on earlier versions
        }
        let logoutFlowController = LogoutFlowController(dependencyContainer: dependencyContainer)
        logoutFlowController.cabinetFlowDidFinish = cabinetFlowDidFinish
        if #available(iOS 13.0, *) {
            logoutFlowController.tabBarItem = UITabBarItem.init(title: "Logout", image: UIImage(systemName: "square.fill"), tag: 1)
        } else {
            // Fallback on earlier versions
        }
        self.viewControllers = [loginFlowController, logoutFlowController]
    }
}

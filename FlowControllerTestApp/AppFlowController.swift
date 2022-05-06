//
//  ViewController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import UIKit

class AppFlowController: UIViewController, UITabBarControllerDelegate {
    
    let dependencyContainer: DependencyContainer
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        if dependencyContainer.storage.isTutorialComplete {
            startCabinet()
        } else {
            startTutorial()
        }
    }
    
    private func startCabinet() {

        let tabBarController = UITabBarController()
        tabBarController.tabBar.layer.borderWidth = 0.50
        tabBarController.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBarController.tabBar.clipsToBounds = true
        tabBarController.delegate = self
        add(childController: tabBarController)
        let loginFlowController = LoginFlowController(dependencyContainer: dependencyContainer)
        loginFlowController.tabBarItem = UITabBarItem.init(title: "Login", image: UIImage(systemName: "circle.fill"), tag: 0)
        let logoutFlowController = LogoutFlowController(dependencyContainer: dependencyContainer)
        logoutFlowController.tabBarItem = UITabBarItem.init(title: "Logout", image: UIImage(systemName: "square.fill"), tag: 1)
        tabBarController.viewControllers = [loginFlowController, logoutFlowController]
    }
    
    private func startTutorial() {
        let tutorialFlowController = TutorialFlowController(dependencyContainer: dependencyContainer)
        tutorialFlowController.delegate = self
        add(childController: tutorialFlowController)
        tutorialFlowController.start()
    }
}

extension AppFlowController: TutorialFlowControllerDelegate {
    func tutorialFlowControllerDidFinish(_ flowController: TutorialFlowController) {
        remove(childController: flowController)
        
        startCabinet()
    }
}


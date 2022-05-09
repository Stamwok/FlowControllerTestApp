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
        let cabinetFlowController = CabinetFlowController(dependencyContainer: dependencyContainer)
        add(childController: cabinetFlowController)
        cabinetFlowController.start()
        
    }
    
    private func startTutorial() {
        let tutorialFlowController = TutorialFlowController(dependencyContainer: dependencyContainer)
        tutorialFlowController.tutorialFlowDidFinish = { [weak self] in
            self?.remove(childController: tutorialFlowController)
            self?.dependencyContainer.storage.isTutorialComplete = true
            self?.startCabinet()
        }
        add(childController: tutorialFlowController)
        tutorialFlowController.start()
    }
}



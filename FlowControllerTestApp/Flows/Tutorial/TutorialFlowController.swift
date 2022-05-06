//
//  TutorialFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import Foundation
import UIKit

protocol TutorialFlowControllerDelegate: AnyObject {
    func tutorialFlowControllerDidFinish(_ flowController: TutorialFlowController)
}

final class TutorialFlowController: UIViewController, TutorialViewControllerDelegate {
    private let dependencyContainer: DependencyContainer
    private let tutorialNavigationController: UINavigationController = UINavigationController()
    weak var delegate: TutorialFlowControllerDelegate?
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
        
        add(childController: tutorialNavigationController)
        
        print("init tutorialFlow")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        let tutorialViewController = TutorialViewController()
        tutorialViewController.flowController = self
        
        tutorialNavigationController.pushViewController(tutorialViewController, animated: true)
    }
    
    func tutorialDidFinish() {
        delegate?.tutorialFlowControllerDidFinish(self)
        dependencyContainer.storage.isTutorialComplete = true
    }
    func nextPage(page: Int) {
        print("nextPage")
        let nextVC = TutorialViewController(page: page)
        nextVC.flowController = self
        tutorialNavigationController.pushViewController(nextVC, animated: true)
    }
}

//
//  TutorialFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import Foundation
import UIKit
import ModelPackage

public class TutorialFlowController: UINavigationController {
    private let dependencyContainer: DependencyContainer
    
    public var tutorialFlowDidFinish: (() -> Void)?
    private lazy var nextTutorialPage: ((Int) -> Void) = { [weak self] nextPage in
        self?.start(page: nextPage)
    }
    
    public init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func start(page: Int = 0) {
        let tutorialViewController = TutorialViewController(page: page)
        tutorialViewController.tutorialDidFinish = tutorialFlowDidFinish
        tutorialViewController.nextTutorialPage = nextTutorialPage
        self.pushViewController(tutorialViewController, animated: true)
    }
}

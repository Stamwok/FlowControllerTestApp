//
//  AuthorizationFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 9.05.22.
//

import UIKit

class AuthorizationFlowController: UINavigationController {
    
    var dependencyContainer: DependencyContainer
    var authorizationDidFinish: ((UIViewController) -> Void)?
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        let authVC = AuthorizationViewController(flags: dependencyContainer.storage)
        authVC.authorizationDidFinish = authorizationDidFinish
        self.pushViewController(authVC, animated: true)
    }
}

//
//  LoginFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 5.05.22.
//

import UIKit

class LoginFlowController: UINavigationController {

    private let loginLabel: UILabel = UILabel()
    private let dependencyContainer: DependencyContainer
    private lazy var loginViewController = LoginViewController(flags: dependencyContainer.storage)
    
    private lazy var authorizationDidFinish: ((UIViewController) -> Void) = { vc in
        vc.dismiss(animated: true, completion: nil)
        self.loginViewController.viewWillAppear(true)
    }
    private lazy var showAuthorization: (() -> Void) = { [weak self] in
        guard let self = self else { return }
        let authFC = AuthorizationFlowController(dependencyContainer: self.dependencyContainer)
        authFC.authorizationDidFinish = self.authorizationDidFinish
        authFC.start()
        self.present(authFC, animated: true)
    }
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginViewController.showAuthorization = showAuthorization
        self.pushViewController(loginViewController, animated: true)
    }
}

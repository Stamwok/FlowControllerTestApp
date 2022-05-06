//
//  LoginFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 5.05.22.
//

import UIKit

class LoginFlowController: UIViewController, LoginViewControllerDelegate, AuthorizationViewControllerDelegate {
    
    

    private let loginLabel: UILabel = UILabel()
    
    private let dependencyContainer: DependencyContainer
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let vc = LoginViewController(flags: dependencyContainer.storage)
        vc.flowController = self
        let nc = UINavigationController(rootViewController: vc)
        add(childController: nc)
    }
    func showAuthorization(completionandler completionHandler: @escaping () -> Void) {
        let vc = AutorisationViewController(flags: dependencyContainer.storage)
        vc.flowController = self
        vc.completion = completionHandler
        let nc = UINavigationController.init(rootViewController: vc)
        self.present(nc, animated: true, completion: nil)
    }
    
    func authorizationDidFinish(childController: UIViewController) {
        childController.dismiss(animated: true, completion: nil)
    }
}

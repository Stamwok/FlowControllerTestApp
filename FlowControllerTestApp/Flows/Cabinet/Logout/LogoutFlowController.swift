//
//  LogoutFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 5.05.22.
//

import UIKit

class LogoutFlowController: UINavigationController {
    
    private var dependencyContainer: DependencyContainer
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = LogoutViewController(flags: dependencyContainer.storage)
        self.pushViewController(vc, animated: true)
    }
}

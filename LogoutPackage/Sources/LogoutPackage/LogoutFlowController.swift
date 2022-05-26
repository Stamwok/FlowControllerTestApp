//
//  LogoutFlowController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 5.05.22.
//

import UIKit
import ModelPackage

public class LogoutFlowController: UINavigationController {
    
    private var dependencyContainer: DependencyContainer
    public var cabinetFlowDidFinish: (() -> Void)?
    
    public init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = LogoutViewController(flags: dependencyContainer.storage)
        vc.cabinetFlowDidFinish = cabinetFlowDidFinish
        self.pushViewController(vc, animated: true)
    }
}

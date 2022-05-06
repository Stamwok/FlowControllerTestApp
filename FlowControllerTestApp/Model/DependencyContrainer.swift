//
//  DependencesContrainer.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import Foundation

struct DependencyContainer {
    var storage: Flags
    
    static func make() -> DependencyContainer {
        return DependencyContainer(storage: Flags())
    }
}

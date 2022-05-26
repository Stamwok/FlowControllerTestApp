//
//  DependencesContrainer.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import Foundation

public struct DependencyContainer {
    public var storage: Flags
    
    public static func make() -> DependencyContainer {
        return DependencyContainer(storage: Flags())
    }
}

//
//  Storage.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import Foundation

final class Flags {
    
    private let storage = UserDefaults.standard
    let storageKey = "Flags"
    
    enum FlagKey: String {
        case login
        case tutorial
    }
    
    var login: String? {
        get {
            return storage.string(forKey: FlagKey.login.rawValue)
        }
        set {
            storage.setValue(newValue, forKey: FlagKey.login.rawValue)
        }
    }
    var isTutorialComplete: Bool {
        get {
            return storage.bool(forKey: FlagKey.tutorial.rawValue)
        }
        set {
            storage.setValue(newValue, forKey: FlagKey.tutorial.rawValue)
        }
    }
    
    init() {}
}

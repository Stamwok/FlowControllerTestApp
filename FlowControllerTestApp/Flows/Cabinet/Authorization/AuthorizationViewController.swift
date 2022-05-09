//
//  AutorisationViewController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import UIKit

class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    
    private let textField = UITextField()
    private let flags: Flags
    var authorizationDidFinish: ((UIViewController) -> Void)?
    
    init(flags: Flags) {
        self.flags = flags
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Authorization"
        view.backgroundColor = .white
        textField.delegate = self
        textField.layer.borderWidth = 0.5
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty, let authorizationDidFinish = authorizationDidFinish {
            flags.login = textField.text
            textField.resignFirstResponder()

            authorizationDidFinish(self)
            return true
        } else {
            return false
        }
        
    }
}

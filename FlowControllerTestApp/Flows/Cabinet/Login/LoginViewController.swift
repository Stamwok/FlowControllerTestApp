//
//  LoginViewController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func showAuthorization(completionandler: @escaping ()->Void)
}

class LoginViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let authButton = UIButton()
    
//    private let loginLabel: UILabel = UILabel()
    
    private var flags: Flags
    
    weak var flowController: LoginViewControllerDelegate?
    
    init(flags: Flags) {
        self.flags = flags
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        
        nameLabel.text = "Name"
        view.addSubview(nameLabel)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        authButton.setTitle("Authorization", for: .normal)
        authButton.backgroundColor = .blue
        view.addSubview(authButton)
        authButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            authButton.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
            authButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        authButton.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func authButtonTapped() {
        flowController?.showAuthorization { [weak self] in
            self?.nameLabel.text = self?.flags.login
            self?.nameLabel.isHidden = false
            self?.authButton.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let login = flags.login {
            print(login)
            nameLabel.text = login
            nameLabel.isHidden = false
            authButton.isHidden = true
        } else {
            nameLabel.isHidden = true
            authButton.isHidden = false
        }
    }
}

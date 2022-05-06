//
//  LogoutViewController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import UIKit

class LogoutViewController: UIViewController {
    
    private var flags: Flags
    
    init(flags: Flags) {
        self.flags = flags
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logoutButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Logout"
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .red
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 100),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if flags.login == nil {
            logoutButton.isEnabled = false
            logoutButton.backgroundColor = .gray
        } else {
            logoutButton.isEnabled = true
            logoutButton.backgroundColor = .red
        }
    }
    
    @objc func logoutButtonTapped() {
        flags.login = nil
        logoutButton.isEnabled = false
        logoutButton.backgroundColor = .gray
    }
}

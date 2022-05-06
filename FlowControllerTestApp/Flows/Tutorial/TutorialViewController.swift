//
//  TutorialViewController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import UIKit

protocol TutorialViewControllerDelegate: AnyObject {
    func tutorialDidFinish()
    func nextPage(page: Int)
}

class TutorialViewController: UIViewController {
    
    weak var flowController: TutorialViewControllerDelegate?
    private let tutorialLabel = UILabel()
    private var page = 0
    
    init(page: Int = 0) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("requered init not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Tutorial"
        navigationItem.backButtonTitle = "Previous page"
        
        tutorialLabel.text = "part \(page)"
        view.addSubview(tutorialLabel)
        tutorialLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tutorialLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tutorialLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let nextButton = UIButton()
        nextButton.backgroundColor = .blue
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: tutorialLabel.bottomAnchor, constant: 10),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width - 50)
        ])
    }
    
    @objc func nextButtonTapped() {
        if page >= 3 {
            flowController?.tutorialDidFinish()
        } else {
            let nextPage = page + 1
            flowController?.nextPage(page: nextPage)
        }
    }
}

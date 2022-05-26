//
//  TutorialViewController.swift
//  FlowControllerTestApp
//
//  Created by  Егор Шуляк on 4.05.22.
//

import UIKit

class TutorialViewController: UIViewController {
    
    var tutorialDidFinish: (() -> Void)?
    var nextTutorialPage: ((Int) -> Void)?
    private let tutorialLabel = UILabel()
    private var page = 0
    
    init(page: Int) {
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
        if #available(iOS 11.0, *) {
            navigationItem.backButtonTitle = "Previous page"
        } else {
            // Fallback on earlier versions
        }
        
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
        if let tutorialDidFinish = tutorialDidFinish, page >= 3 {
            tutorialDidFinish()
        } else if let nextTutorialPage = nextTutorialPage {
            let nextPage = page + 1
            nextTutorialPage(nextPage)
        }
    }
}

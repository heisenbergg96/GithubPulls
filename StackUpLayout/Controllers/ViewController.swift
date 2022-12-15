//
//  ViewController.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 08/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let launchButton = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        view.addSubview(launchButton)
        
        launchButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        launchButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            left: view.leadingAnchor,
                            right: view.trailingAnchor,
                            padding: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20),
                            height: 50)
    }

    @objc private func buttonTapped() {
        let vc = StackUpController(dataSource: StackUpModel.dataSource(), spacing: 100)
        present(vc, animated: true)
    }
}


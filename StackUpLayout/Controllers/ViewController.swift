//
//  ViewController.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 08/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let launchButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        launchButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        launchButton.setTitle("Launch", for: .normal)
        
        view.addSubview(launchButton)
        
        launchButton.setSize(width: 100, height: 48)
        
        launchButton.backgroundColor = .black
        launchButton.setTitleColor(.red, for: .normal)
        
        launchButton.center(centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        
    }

    @objc private func buttonTapped() {
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green
        
        
        
        
        let vc = StackUpController(dataSource: StackUpModel.dataSource(), spacing: 100)
        
        present(vc, animated: true)
    }
}


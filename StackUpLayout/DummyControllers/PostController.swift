//
//  PostController.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 11/12/22.
//

import Foundation
import UIKit

class PostController: UIViewController {
    
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        
        imageView.anchor(top: view.topAnchor,
                         left: view.leadingAnchor,
                         right: view.trailingAnchor,
                         height: 220)
        
        descriptionLabel.anchor(top: imageView.bottomAnchor,
                                left: view.leadingAnchor,
                                right: view.trailingAnchor,
                                padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        
        imageView.image = UIImage(named: "cap")
        imageView.contentMode = .scaleAspectFit
        
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.text = "Discovered in modern times, Captain America joined forces with the heroes who would become the Avengers during the attack by Loki and the Chitauri on New York.His speed and stamina increased by the Super-Soldier serum, Captain America is usually the first leading the way into battle, with few able to keep up with him."
        
        view?.backgroundColor = .white
    }
}

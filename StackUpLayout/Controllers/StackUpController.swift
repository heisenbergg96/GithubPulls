//
//  StackUpController.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 11/12/22.
//

import Foundation
import UIKit


class StackUpController: UIViewController {
    
    // MARK: - Private variables
    private let dataSource: [StackUpModel]
    private let spacing: Int
    private let cta = CustomButton()
    private var stack = Stack<StackUpModel>()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (indexNo, data) in dataSource.enumerated() {
            setup(data.controller, index: indexNo)
        }
        
        view.addSubview(cta)
        view.backgroundColor = .clear
        
        cta.anchor(bottom: view.bottomAnchor,
                   left: view.leadingAnchor,
                   right: view.trailingAnchor,
                   height: 80)
        cta.addTarget(self, action: #selector(ctaTapped(_ :)), for: .touchUpInside)
        
        cta.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cta.layer.masksToBounds = true
        cta.layer.cornerRadius = 40
        
        cta.setTitle(stack.peek()?.ctaTitle, for: .normal)
    }
    
    init(dataSource: [StackUpModel], spacing: Int = 50) {
        self.dataSource = dataSource
        self.spacing = spacing
        if let data = dataSource.first {
            stack.push(data)
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setup(_ controller: UIViewController, index: Int) {
                
        controller.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        controller.view.layer.masksToBounds = true
        controller.view.layer.cornerRadius = 40
        
        let spacing = CGFloat(spacing * index)
        let y = index == 0 ? spacing : UIScreen.main.bounds.height
        let height = view.bounds.height - spacing
        let frame = CGRect(x: 0, y: y, width: view.bounds.width, height: height)
        
        addChildVC(controller: controller, frame: frame)
                
        controller.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                    action: #selector(controllerTapped(_ :))))
    }
    
    @objc private func controllerTapped(_ gesture: UITapGestureRecognizer) {
        
        // if we click on the current controller no animation should happen. 
        if gesture.view === stack.peek()?.controller.view {
            return
        }
        
        // #1 get index of the controller that is tapped
        let tappedIndex = dataSource.firstIndex { $0.controller.view === gesture.view }
        
        guard let index = tappedIndex else { return }
        
        // #2 get array of controllers next to that controller
        guard let data = dataSource.getElements(from: index + 1) else {
            return
        }
                
        let controllerToBeDismissed = data.map { $0.controller }
        
        // #3 Dimiss all those controllers
        animateView(controllers: controllerToBeDismissed, y: UIScreen.main.bounds.height) { [weak self] in
        // #4 remove all those controllers from the stack after animating
            print("Controller popped")
            self?.stack.items.removeAll(where: { controllerToBeDismissed.contains($0.controller) })
            self?.cta.setTitle(self?.stack.peek()?.ctaTitle, for: .normal)
        }
    }
    
    @objc private func ctaTapped(_ button: UIButton) {
        
        //#1 get the controller currently visible -> get it from stack top
        let controller: UIViewController? = stack.peek()?.controller
        
        //#2 find the controller that is next in the list of controllers that we have
        guard let index = dataSource.firstIndex(where: { $0.controller === controller }) else { return }
        
        let nextIndex = index + 1

        //#3 push that controller and add it to the stack
        guard dataSource.isIndexExists(idx: nextIndex),
              let data = dataSource[guarded: nextIndex] else {
            return
        }
        
        let y = CGFloat(spacing * nextIndex)
        
        animateView(controllers: [data.controller], y: y) {
            print("Controller pushed")
            self.stack.push(data)
            self.cta.setTitle(self.stack.peek()?.ctaTitle, for: .normal)
        }
    }
}

// MARK: - Animation
extension StackUpController {
    
    func animateView(controllers: [UIViewController], y: CGFloat, completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0.6) {
            controllers.forEach { $0.view.frame.origin.y = y }
        } completion: { _ in
            completion()
        }
    }
}

class Colors {
    
    static let lessBlack = UIColor(red: 33/255, green: 40/255, blue: 50/255, alpha: 1)
    static let moreBlack = UIColor(red: 21/255, green: 26/255, blue: 30/255, alpha: 1)
    static let dpColor = UIColor(red: 59/255, green: 71/255, blue: 89/255, alpha: 1)
    static let someTextColor = UIColor(red: 183/255, green: 196/255, blue: 233/255, alpha: 1)
    static let offWhite = UIColor.init(red: 225/255, green: 225/255, blue: 235/255, alpha: 1)

}


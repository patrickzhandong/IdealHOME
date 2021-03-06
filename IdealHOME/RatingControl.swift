//
//  RatingControl.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/10/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton] ()
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didset{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5
    var rating = 0
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        
        
    }
    
    required init(coder:NSCoder){
        super.init(coder: coder)
        setupButtons()
    }
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button Pressed 👍")
    }

    //MARK: Private Methods
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
   
}

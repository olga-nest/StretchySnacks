//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Olga on 11/9/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var navbarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    var navBarIsOpen: Bool = false
    var stackView = UIStackView()
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }

    //MARK: Actions
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("Plus icon pressed")
        
        func addButtonRotation() {
            UIView.animate(withDuration: 1, animations: ({
                self.addButton.transform = self.addButton.transform.rotated(by: CGFloat(Double.pi / 4))
            }))
        }
        
        switch navBarIsOpen {
        case false:
            addButtonRotation()
            navBarSpringAnimation(navBarIsOpen: navBarIsOpen)
            navBarIsOpen = true
            stackView.isHidden = false
        default:
            addButtonRotation()
            navBarSpringAnimation(navBarIsOpen: navBarIsOpen)
            navBarIsOpen = false
            stackView.isHidden = true
        }
    }
    
    func navBarSpringAnimation(navBarIsOpen: Bool) {
        
        func animation(height: Int) {
            UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 5, options: [], animations: {
                // Values for end state of animation
                self.navigationBar.frame = CGRect(x: self.navigationBar.frame.minX, y: self.navigationBar.frame.minY, width: self.navigationBar.frame.width, height: CGFloat(height))
            })
        }
        if navBarIsOpen == false {
            animation(height: 200)
        } else {
            animation(height: 64)
        }
    }
    
    //MARK: Stack view
    
    func setupStackView() {
        stackView.axis  = UILayoutConstraintAxis.horizontal
        stackView.distribution  = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.spacing   = 8.0
        
        //Oreo Image View
        let oreoImageView = UIImageView()
        oreoImageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        oreoImageView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        oreoImageView.image = UIImage(named: "oreos")
        
        stackView.addArrangedSubview(oreoImageView)
        
        //Pizza_pockets Image View
        let pizza_pocketsImageView = UIImageView()
        pizza_pocketsImageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        pizza_pocketsImageView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        pizza_pocketsImageView.image = UIImage(named: "pizza_pockets")
        
        stackView.addArrangedSubview(pizza_pocketsImageView)
        
        //Pop_tarts Image View
        let pop_tartsImageView = UIImageView()
        pop_tartsImageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        pop_tartsImageView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        pop_tartsImageView.image = UIImage(named: "pop_tarts")
        
        stackView.addArrangedSubview(pop_tartsImageView)
        
        
        stackView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: self.navigationBar.frame.width).isActive = true
  //      stackView.centerXAnchor.constraint(equalTo: self.navigationBar.centerXAnchor).isActive = true
 //    stackView.centerYAnchor.constraint(equalTo: self.navigationBar.centerYAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationBar.addSubview(stackView)
   //     stackView.isHidden = true
        
       
    }

}

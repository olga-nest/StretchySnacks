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
        stackView.isHidden = true
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
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.distribution = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.spacing = 5.0
        
        let heighConstant = 100.0 as CGFloat
        let widthConstant = 70.0 as CGFloat
        
        //Oreo Image View
        let oreoImageView = UIImageView()
        oreoImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        oreoImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        oreoImageView.image = UIImage(named: "oreos")
        
        stackView.addArrangedSubview(oreoImageView)
        
        //Pizza_pockets Image View
        let pizza_pocketsImageView = UIImageView()
        pizza_pocketsImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        pizza_pocketsImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        pizza_pocketsImageView.image = UIImage(named: "pizza_pockets")
        
        stackView.addArrangedSubview(pizza_pocketsImageView)
        
        //Pop_tarts Image View
        let pop_tartsImageView = UIImageView()
        pop_tartsImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        pop_tartsImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        pop_tartsImageView.image = UIImage(named: "pop_tarts")
        
        stackView.addArrangedSubview(pop_tartsImageView)
        
        //Popsicle Image View
        let popsicleImageView = UIImageView()
        popsicleImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        popsicleImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        popsicleImageView.image = UIImage(named: "popsicle")
        
        stackView.addArrangedSubview(popsicleImageView)
        
        //Ramen Image View
        let ramenImageView = UIImageView()
        ramenImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        ramenImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        ramenImageView.image = UIImage(named: "ramen")
        
        stackView.addArrangedSubview(ramenImageView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationBar.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.navigationBar.topAnchor, constant: 64).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.navigationBar.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.navigationBar.trailingAnchor, constant: -10).isActive = true
    }

}

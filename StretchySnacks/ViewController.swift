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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: Actions
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("Plus icon pressed")
        
        switch navBarIsOpen {
        case false:
            UIView.animate(withDuration: 1, animations: ({
                self.addButton.transform = self.addButton.transform.rotated(by: CGFloat(Double.pi / 4))
            }))
            navBarSpringAnimation(navBarIsOpen: navBarIsOpen)
            navBarIsOpen = true
        default:
            UIView.animate(withDuration: 1, animations: ({
                self.addButton.transform = self.addButton.transform.rotated(by: CGFloat(Double.pi / 4))
            }))
            navBarSpringAnimation(navBarIsOpen: navBarIsOpen)
            navBarIsOpen = false
        }
        
        
        
    }
    
    func navBarSpringAnimation(navBarIsOpen: Bool) {
        if navBarIsOpen == false {
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 5, options: [], animations: {
            // Values for end state of animation
            self.navigationBar.frame = CGRect(x: self.navigationBar.frame.minX, y: self.navigationBar.frame.minY, width: self.navigationBar.frame.width, height: 200)
       })
        } else {
            UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 5, options: [], animations: {
                // Values for end state of animation
                self.navigationBar.frame = CGRect(x: self.navigationBar.frame.minX, y: self.navigationBar.frame.minY, width: self.navigationBar.frame.width, height: 64)
            })
        }

    }

}


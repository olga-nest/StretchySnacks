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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: Actions
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("Plus icon pressed")
        navBarSpringAnimation()
    }
    
    func navBarSpringAnimation() {
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 5, options: [], animations: {
            // Values for end state of animation
            self.navigationBar.frame = CGRect(x: self.navigationBar.frame.minX, y: self.navigationBar.frame.minY, width: self.navigationBar.frame.width, height: 200)
       })

    }

}


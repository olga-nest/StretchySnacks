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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: Actions
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("Plus icon pressed")
        navbarHeightConstraint.constant = 200
    }
    

}


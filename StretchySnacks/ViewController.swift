//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Olga on 11/9/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    @IBOutlet weak var navbarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var navBarIsOpen: Bool = false
    var stackView = UIStackView()
    var snacks = [String]()
    
    let oreoImageView = UIImageView()
    let pizza_pocketsImageView = UIImageView()
    let pop_tartsImageView = UIImageView()
    let popsicleImageView = UIImageView()
    let ramenImageView = UIImageView()
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupStackView()
        setupNavbarTitle()
        stackView.isHidden = true
        addGuestureRecognizers()
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
        if navBarIsOpen == false {
            navbarHeightConstraint.constant = 200
        } else {
            navbarHeightConstraint.constant = 64
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
        oreoImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        oreoImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        oreoImageView.image = UIImage(named: "oreos")
        oreoImageView.isUserInteractionEnabled = true
        
        stackView.addArrangedSubview(oreoImageView)
        
        //Pizza_pockets Image View
        pizza_pocketsImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        pizza_pocketsImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        pizza_pocketsImageView.image = UIImage(named: "pizza_pockets")
        pizza_pocketsImageView.isUserInteractionEnabled = true
        
        stackView.addArrangedSubview(pizza_pocketsImageView)
        
        //Pop_tarts Image View
        pop_tartsImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        pop_tartsImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        pop_tartsImageView.image = UIImage(named: "pop_tarts")
        pop_tartsImageView.isUserInteractionEnabled = true
        
        stackView.addArrangedSubview(pop_tartsImageView)
        
        //Popsicle Image View
        //P.S. You'll see pizza pockets instead;)
        popsicleImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        popsicleImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        popsicleImageView.image = UIImage(named: "pizza_pockets")
        popsicleImageView.isUserInteractionEnabled = true
        
        stackView.addArrangedSubview(popsicleImageView)
        
        //Ramen Image View
        
        ramenImageView.heightAnchor.constraint(equalToConstant: heighConstant).isActive = true
        ramenImageView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        ramenImageView.image = UIImage(named: "ramen")
        ramenImageView.isUserInteractionEnabled = true
        
        stackView.addArrangedSubview(ramenImageView)
     
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationBar.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.navigationBar.topAnchor, constant: 64).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.navigationBar.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.navigationBar.trailingAnchor, constant: -10).isActive = true
        
    }
    
    func setupNavbarTitle() {
        //Snacks label
        let snacksLabel = UILabel()
        snacksLabel.translatesAutoresizingMaskIntoConstraints = false
        snacksLabel.text = "SNACKS"
        snacksLabel.textAlignment = .center
        
        navigationBar.addSubview(snacksLabel)
        
        snacksLabel.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
        snacksLabel.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor).isActive = true
    }
    
    //MARK: Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return snacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "snackCell", for: indexPath)
        
        cell.textLabel?.text = snacks[indexPath.row]
        
        return cell
    }
    
    //MARK: Guestures
    func addGuestureRecognizers() {
        let oreoTapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(tapGuestureRecognizer:)))
        oreoImageView.addGestureRecognizer(oreoTapGuestureRecognizer)
        
        let pizzaTapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(tapGuestureRecognizer:)))
        pizza_pocketsImageView.addGestureRecognizer(pizzaTapGuestureRecognizer)
        
        let popTapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(tapGuestureRecognizer:)))
        pop_tartsImageView.addGestureRecognizer(popTapGuestureRecognizer)
        
        let popsicleTapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(tapGuestureRecognizer:)))
        popsicleImageView.addGestureRecognizer(popsicleTapGuestureRecognizer)
        
        let ramenTapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(tapGuestureRecognizer:)))
        ramenImageView.addGestureRecognizer(ramenTapGuestureRecognizer)
        
    }
    
    @objc func handleTap(tapGuestureRecognizer: UITapGestureRecognizer) {
        switch tapGuestureRecognizer.view as! UIImageView {
        case oreoImageView:
            snacks.append("Oreo")
        case pizza_pocketsImageView:
            snacks.append("Pizza pockets")
        case pop_tartsImageView:
            snacks.append("Pop tarts")
        case popsicleImageView:
            snacks.append("Popsicle. Yes this is popsicle")
        case ramenImageView:
            snacks.append("Ramen")
        default:
            snacks.append("Crazy Icecream")
        }
        let indexPath = IndexPath(row: snacks.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)

    }
}

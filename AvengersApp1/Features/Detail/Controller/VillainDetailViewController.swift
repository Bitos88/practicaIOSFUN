//
//  VillainDetailViewController.swift
//  AvengersApp1
//
//  Created by Alberto Alegre Bravo on 11/7/21.
//

import UIKit

class VillainDetailViewController: UIViewController {
    
    
    // MARK - Public properties
    
    var villain: Villain?
    
    // MARK - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var bioTextView: UITextView!

    
    // MARK - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.textColor = .systemPink
        
        villainImage.image = UIImage(named: villain?.image ?? "")
        nameLabel.text = villain?.name
        bioTextView.text = villain?.biografia
        
        if let pw = villain?.power {
        powerLabel.text = "Power: \(pw)"
        }
        
    }
}

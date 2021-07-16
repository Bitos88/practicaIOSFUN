//
//  AvengerDetailViewController.swift
//  AvengersApp1
//
//  Created by Alberto Alegre Bravo on 13/7/21.
//

import UIKit

class AvengerDetailViewController: UIViewController {
    
    
    var avenger: Avenger?
    
    // MARK - IBOutlets
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var bioTextView: UITextView!
    
    @IBOutlet weak var powerLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.textColor = .systemPink
        
        image.image = UIImage(named: avenger?.image ?? "")
        nameLabel.text = avenger?.name
        bioTextView.text = avenger?.biografia
        
        if let pw = avenger?.power {
        powerLabel.text = "Power: \(pw)"
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
}

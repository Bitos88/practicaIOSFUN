//
//  VillainsTableViewController.swift
//  AvengersApp1
//
//  Created by Alberto Alegre Bravo on 11/7/21.
//

import UIKit

class VillansTableViewController: UITableViewCell {
    
    static let identifier: String = String(describing: VillansTableViewController.self)
    
    // MARK - IBOutlets
    
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    // MARK - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        villainImage.layer.cornerRadius = 4.0
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        villainImage.image = nil
        name.text = nil
    }
    
    func updateView(villain: Villain) {
        update(name: villain.name)
        update(image: villain.image)
    }
    
    private func update(image: String?) {
        villainImage.image = UIImage(named: image ?? "")
    }
    
    private func update(name: String){
        
        self.name.text = name
    }
    
}

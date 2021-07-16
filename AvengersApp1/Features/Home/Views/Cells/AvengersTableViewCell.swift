//
//  AvengersTableViewController.swift
//  AvengersApp1
//
//  Created by Alberto Alegre Bravo on 10/7/21.
//

import UIKit

class AvengersTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: AvengersTableViewCell.self)
    
    // MARK - IBOutlets
    
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var avengerimage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var power: UILabel!
    
    
    // MARK - Lifecycle
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        avengerimage.layer.cornerRadius = 4.0
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avengerimage.image = nil
        name.text = nil
    }
    
    func updateview(avenger: Avenger) {
        update(name: avenger.name)
        update(image: avenger.image)
    }
    
    private func update(name: String?) {
        self.name.text = name
    }
    
    private func update(image: String?) {
        avengerimage.image = UIImage(named: image ?? "")
    }
    
}

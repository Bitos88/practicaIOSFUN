//
//  VillainViewController.swift
//  AvengersApp1
//
//  Created by Alberto Alegre Bravo on 11/7/21.
//

import UIKit

class VillainViewController: UIViewController {
    
    // MARK - IBOutlets
    
    @IBOutlet weak var tableview: UITableView!
    
    // MARK - Private properties
    
    private var villains: villains = []
    private let villainsRepository = VillainRepository()
    
    //MARK - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        loadData()
        tableview.reloadData()
    }
    
    // MARK - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? VillainDetailViewController,
              let villain = sender as? Villain else {
            return
        }
        
        destination.villain = villain
    }
    
    private func loadData() {
        
        villains = villainsRepository.villanosSample
        
    }
}

extension VillainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return villains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: VillansTableViewController.identifier,
                                                 for: indexPath) as? VillansTableViewController
        
        if indexPath.row < villains.count {
            cell?.updateView(villain: villains[indexPath.row])
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row < villains.count {
            let villain = villains[indexPath.row]
            
            //Opción 1 de navegacion
            
            performSegue(withIdentifier: "SEGUE_VILLAIN_TO_DETAIL",
                         sender: villain)
            
            //Opcion 2 de navegacion
            
            //let storyboardVillain = UIStoryboard(name: "Detail", bundle: nil)
            
            //if let destination = storyboardVillain.instantiateInitialViewController() as? VillainDetailViewController {
            //    destination.villain = villain
             //   navigationController?.pushViewController(destination, animated: true)
            //}
        }
    }
}

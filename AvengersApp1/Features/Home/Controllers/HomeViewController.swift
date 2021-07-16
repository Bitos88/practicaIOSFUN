//
//  ViewController.swift
//  AvengersApp1
//
//  Created by Alberto Alegre Bravo on 7/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK - IBOutlets
    
    @IBOutlet weak var tableview: UITableView!
    
    // MARK - Private properties
    
    
    private var avengers: Avengers = []
    private let avengersRepository = AvengerRepository()
    
    // MARK - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        loadData()
        tableview.reloadData()
    }
    
    // MARK - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AvengerDetailViewController,
              let avenger = sender as? Avenger else {
            return
        }
        
        destination.avenger = avenger
    }
    
    private func loadData() {
        avengers = avengersRepository.avengersSample
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avengers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: AvengersTableViewCell.identifier,
                                                 for: indexPath) as? AvengersTableViewCell
        
        if indexPath.row < avengers.count {
            cell?.updateview(avenger: avengers[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < avengers.count {
            let avenger = avengers[indexPath.row]
            
            //Opción 1 de navegacion
            
            performSegue(withIdentifier: "SEGUE_AVENGER_TO_DETAIL",
                         sender: avenger)
        }
    }
}

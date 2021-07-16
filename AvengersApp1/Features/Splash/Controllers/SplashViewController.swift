//
//  SplashViewController.swift
//  AvengersApp1
//
//  Created by Alberto Alegre Bravo on 7/7/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    //SEGUE_FROM_SPLASH_TO_HOME
    
    //MARK: IBOutlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        activityIndicator.startAnimating()
        loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Private Methods
    
    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            print("Data Loaded")
            
            //self?.performSegue(withIdentifier: "SEGUE_FROM_SPLASH_TO_HOME",
            //             sender: nil)
            
            
            let homeStoryBoard = UIStoryboard(name: "Home",
                                              bundle: nil)
            
            if let destination = homeStoryBoard.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destination], animated: true)
                
            }
            
        }
    }
}

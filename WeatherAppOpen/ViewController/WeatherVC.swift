//
//  WeatherViewController.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 09/09/2024.
//

import UIKit

class WeatherViewController: UIViewController {
    //MARK: - Properties & variables
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI(){
        searchBar.searchBarStyle = .minimal
    }
}

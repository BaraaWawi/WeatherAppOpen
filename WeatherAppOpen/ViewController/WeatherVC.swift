//
//  WeatherVC.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 09/09/2024.
//

import UIKit

class WeatherVC: UIViewController {
    //MARK: - Properties & variables
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var weatherViewModel = WeatherViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchWeatherData()
    }
    
    //MARK: - ConfigureUI
    private func configureUI(){
        setupSearchBar()
        setupTableView()
    }
    
    private func setupSearchBar(){
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.register(WeatherTableViewCell.nib, forCellReuseIdentifier: WeatherTableViewCell.cellId)
        tableView.separatorColor = .lightGray
    }
    
    //MARK: - Methods
    private func fetchWeatherData() {
        weatherViewModel.getItemsList {[weak self] in
            guard let self else {return}
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
}//end WeatherVC


//MARK: - UITableViewDataSource+Extension
extension WeatherVC : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if weatherViewModel.weatherData.count == 0{
            tableView.setNoNoDataMessage("No data found")
        } else{
            tableView.removeNoNoDataMessage()
        }
        return weatherViewModel.weatherData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return weatherViewModel.weatherData[section].city.capitalized
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherViewModel.weatherData[section].weather.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.cellId, for: indexPath) as? WeatherTableViewCell else{
            print("Error dequeuing cell")
            return UITableViewCell()
        }
        
        let cityWeather = weatherViewModel.weatherData[indexPath.section]
        cell.itemWeather = cityWeather.weather[indexPath.row]
        return cell
    }
    
    
}//end UITableViewDataSource Extension

//MARK: - UISearchBarDelegate
extension WeatherVC : UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()

        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        
        weatherViewModel.getItemsList(isSearching: true,city: searchText) { [weak self] in
            guard let self else {return}
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
                
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            fetchWeatherData() // this will return the normal data , if they're cached then it will return the cached data
        }
    }
}//end UISearchBarDelegate

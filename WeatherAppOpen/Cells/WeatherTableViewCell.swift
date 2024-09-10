//
//  WeatherTableViewCell.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 09/09/2024.
//

import UIKit

class WeatherTableViewCell: UITableViewCell{
    //MARK: - Properties & variables
    static let cellId = "WeatherTableViewCell"
    static let nib = UINib(nibName: cellId, bundle: nil)
    
    @IBOutlet weak var maxTempTitleLbl: UILabel!
    @IBOutlet weak var minTempTitleLbl: UILabel!
    @IBOutlet weak var avgtempTitleLbl: UILabel!
    @IBOutlet weak var sunHourTitleLbl: UILabel!
    
    @IBOutlet weak var maxTempDataLbl: UILabel!
    @IBOutlet weak var minTempDataLbl: UILabel!
    @IBOutlet weak var avgtempDataLbl: UILabel!
    @IBOutlet weak var sunHourDataLbl: UILabel!
    
    var itemWeather : WeatherInfoModel?{
        didSet{
            loadCell()
        }
    }
    
    //MARK: - AwakeFromNib
    override func awakeFromNib(){
        super.awakeFromNib()
        maxTempTitleLbl.text = "Max Tempreture:"
        minTempTitleLbl.text = "Min Tempreture:"
        avgtempTitleLbl.text = "Average Tempreture:"
        sunHourTitleLbl.text = "Sun Hour:"
    }
    
    //MARK: - Methods
    private func loadCell(){
        guard let itemWeather else{return}
        maxTempDataLbl.text = itemWeather.maxtempC
        minTempDataLbl.text = itemWeather.mintempC
        avgtempDataLbl.text = itemWeather.avgtempC
        sunHourDataLbl.text = itemWeather.sunHour
    }
    
}

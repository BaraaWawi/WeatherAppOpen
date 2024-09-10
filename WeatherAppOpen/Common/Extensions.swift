//
//  Extensions.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 10/09/2024.
//

import UIKit

extension UITableView {
    
    func setNoNoDataMessage(_ label: String) {
        
        let noNoDataLabel = UILabel()
        noNoDataLabel.text = label
        noNoDataLabel.textColor = .gray
        noNoDataLabel.textAlignment = .center
        
        let labelContainer = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: self.bounds.size.width,
                                                  height: self.bounds.size.height))
        labelContainer.addSubview(noNoDataLabel)
        
        noNoDataLabel.translatesAutoresizingMaskIntoConstraints = false
        noNoDataLabel.centerXAnchor.constraint(equalTo: labelContainer.centerXAnchor).isActive = true
        noNoDataLabel.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor).isActive = true
        
        self.backgroundView = labelContainer
        self.separatorStyle = .none
    }
    
    func removeNoNoDataMessage() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }

}

//
//  CustomTableViewCell.swift
//  InClass8
//
//  Created by Evans, Jonathan on 3/29/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var forecastImage: UIImageView!
    
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    @IBOutlet weak var TemperatureLabel: UILabel!
    
    
    @IBOutlet weak var MaxTempLabel: UILabel!
    
    
    @IBOutlet weak var MinTempLabel: UILabel!
    
    
    @IBOutlet weak var HumidityLabel: UILabel!
    
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    @IBOutlet weak var ForecastImageOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

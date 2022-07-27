//
//  WeatherDayTableViewCell.swift
//  Ratp
//
//  Created by Lucas on 27/07/2022.
//

import UIKit

class WeatherDayTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }

        func setDataset(_ weatherDay: WeatherDay) {
            self.dateLabel.text = weatherDay.date
            self.descriptionLabel.text = weatherDay.description
            self.tempMinLabel.text = String(weatherDay.tempMin)
            self.tempMaxLabel.text = String(weatherDay.tempMax)

        }
    }



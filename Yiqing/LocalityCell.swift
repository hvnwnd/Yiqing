//
//  LocalityCell.swift
//  Yiqing
//
//  Created by Bin CHEN on 2/4/20.
//  Copyright © 2020 Fantestech. All rights reserved.
//

import UIKit

class LocalityCell: UITableViewCell {
    @IBOutlet var localityLabel: UILabel!
    @IBOutlet var confirmed: UILabel!
    @IBOutlet var suspect: UILabel!
    @IBOutlet var cure: UILabel!
    @IBOutlet var dead: UILabel!
    
    func configure(_ locality: Locality) {
        localityLabel.text = locality.provinceShortName
        confirmed.text = "\(locality.confirmedCount)"
//        suspect.text = "\(locality.suspectedCount)"
        cure.text = "\(locality.curedCount)"
        dead.text = "\(locality.deadCount)"
        
        var bgColor: UIColor
        if locality.confirmedCount > 10000 {
            bgColor = UIColor(red: 247.0/255.0, green: 1.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        } else if locality.confirmedCount > 1000 {
            bgColor = UIColor(red: 248.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)
        } else if locality.confirmedCount > 100 {
            bgColor = UIColor(red: 247.0/255.0, green: 82.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        } else if locality.confirmedCount > 10 {
            bgColor = UIColor(red: 248.0/255.0, green: 124.0/255.0, blue: 124.0/255.0, alpha: 1.0)
        } else {
            bgColor = UIColor(red: 247.0/255.0, green: 166.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        }
        contentView.backgroundColor = bgColor

    }
    
}

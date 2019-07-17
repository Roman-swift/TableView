//
//  MyTableViewCell.swift
//  lection_ tableView_1.07
//
//  Created by Роман Родителев on 7/1/19.
//  Copyright © 2019 Роман Родителев. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myTitleLabel: UILabel!
    
    func configure(_ task: Task) {
        myTitleLabel.text = task.title
        
  }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

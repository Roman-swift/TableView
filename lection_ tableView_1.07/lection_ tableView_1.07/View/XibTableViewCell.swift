//
//  XibTableViewCell.swift
//  lection_ tableView_1.07
//
//  Created by Роман Родителев on 7/1/19.
//  Copyright © 2019 Роман Родителев. All rights reserved.
//

import UIKit

protocol XibTableViewCellDelegate: class {
    func didChangeActivity(_ cell: XibTableViewCell, isActive:Bool)
}

class XibTableViewCell: UITableViewCell {

    @IBOutlet weak var xibTitleLabel: UILabel!
    @IBOutlet weak var xibDescriptionLabel: UILabel!
    @IBOutlet weak var activeSwitch: UISwitch!
    @IBAction func didChangeActivity(_ sender: UISwitch) {
        delegate?.didChangeActivity(self, isActive: sender.isOn)
    }
   
    private var task:Task?
    weak var delegate: XibTableViewCellDelegate?
    
    func configure(_ task: Task) {
       // self.task = task
        xibTitleLabel.text = task.title
        xibDescriptionLabel.text  = task.description
        activeSwitch.isOn = task.isActive
    
}
}

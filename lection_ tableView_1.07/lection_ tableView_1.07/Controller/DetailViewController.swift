//
//  DetailViewController.swift
//  lection_ tableView_1.07
//
//  Created by Роман Родителев on 7/4/19.
//  Copyright © 2019 Роман Родителев. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
    func changeActivity(isActive: Bool, indexPath: IndexPath)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleTaskLabel: UILabel!
    @IBOutlet weak var descriptionTaskLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activitySwitch: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    var task: Task?
    var indexPath: IndexPath?
    var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 4
        
        if let task = self.task {
            titleTaskLabel.text = task.title
            descriptionTaskLabel.text = task.description
            imageView.image = UIImage(data: task.image)
            setDateLabel(from: task, for: dateLabel)
            adressLabel.text = task.adress
            activitySwitch.isEnabled = true
            activitySwitch.isOn = task.isActive
        } else {
            titleTaskLabel.text = "Please select task!"
            descriptionTaskLabel.text = ""
            adressLabel.text = ""
            activitySwitch.isEnabled = false
            dateLabel.text = ""
        }
    }
    
    private func setDateLabel(from task: Task, for label: UILabel) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let edDate = dateFormatter.string(from: task.date)
        label.text = edDate
    }
    
    @IBAction func changeTaskActivityButton(_ sender: UISwitch) {
        delegate?.changeActivity(isActive: sender.isOn, indexPath: indexPath!)
    }
}


//
//  MainViewController.swift
//  lection_ tableView_1.07
//
//  Created by Роман Родителев on 7/14/19.
//  Copyright © 2019 Роман Родителев. All rights reserved.
//

import UIKit

class MainViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
   
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}



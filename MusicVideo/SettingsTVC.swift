//
//  SettingsTVC.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 6/3/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
//

import UIKit

class SettingsTVC: UITableViewController {
    
    
    @IBOutlet var aboutDisplay: UILabel!
    @IBOutlet var feedBackDisplay: UILabel!
    @IBOutlet var securityDisplay: UILabel!
    @IBOutlet var touchID: UISwitch!
    @IBOutlet var bestImageDisplay: UILabel!
    @IBOutlet var APICnt: UILabel!
    @IBOutlet var sliderCnt: UISlider!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    }

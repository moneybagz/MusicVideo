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

        touchID.isOn = UserDefaults.standard.bool(forKey: "SecSetting")
        
        title = "settings"
    }
    
    @IBAction func touchIdSec(_ sender: UISwitch) {
        
        let defaults = UserDefaults.standard
        if touchID.isOn {
            defaults.set(touchID.isOn, forKey: "SecSetting")
        }
        else {
            defaults.set(false, forKey: "SecSetting")
        }
    }

}

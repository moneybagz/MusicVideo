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
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        touchID.isOn = UserDefaults.standard.bool(forKey: "SecSetting")
        
        if UserDefaults.standard.object(forKey: "APICNT") != nil {
            let theValue = UserDefaults.standard.object(forKey: "APICNT") as? NSNumber.IntegerLiteralType
            APICnt.text = "\(String(describing: theValue))"
            sliderCnt.value = Float(theValue!)
        } else {
            sliderCnt.value = 10.0
            APICnt.text = "\(Int(sliderCnt.value))"
        }
        
        title = "settings"
        
        
    }
    @IBAction func valueChanged(_ sender: UISlider) {
        
        let defaults = UserDefaults.standard
        defaults.set(Int(sliderCnt.value), forKey: "APICNT")
        APICnt.text = "\(Int(sliderCnt.value))"
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

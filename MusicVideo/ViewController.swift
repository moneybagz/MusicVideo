//
//  ViewController.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 4/22/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
// CHEESE!

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = APIManager()
        api.loadData(urlString: "http://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func didLoadData(result:String) {
        
        let alertController = UIAlertController(title: result, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}


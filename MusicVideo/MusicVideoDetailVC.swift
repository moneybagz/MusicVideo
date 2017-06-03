//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 6/2/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
//

import UIKit

class MusicVideoDetailVC: UIViewController {
    
    
    @IBOutlet var vName: UILabel!
    @IBOutlet var videoImage: UIImageView!
    @IBOutlet var vGenre: UILabel!
    @IBOutlet var vPrice: UILabel!
    @IBOutlet var vRights: UILabel!
    
    var videos:Videos!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = videos.vArtist
        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vRights.text = videos.vRights
        vGenre.text = videos.vGenre
        
        if videos.vImageData != nil {
            videoImage.image = UIImage(data: videos.vImageData!)
        }
        else {
            videoImage.image = UIImage(named: "sorry-image-not-available")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  MusicVideoTableViewCell.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 6/2/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
//

import UIKit

class MusicVideoTableViewCell: UITableViewCell {
    
    var video: Videos? {
        didSet {
            updateCell()
        }
    }
    
    @IBOutlet var musicImage: UIImageView!

    @IBOutlet var rank: UILabel!
    
    @IBOutlet var musicTitle: UILabel!
    
    func updateCell() {
        
        musicTitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        rank.font = UIFont.preferredFont(forTextStyle: .body)
        
        musicTitle.text = video?.vName
        rank.text = "\(video!.vRank)"
        //musicImage.image = UIImage(named: "sorry-image-not-available")
        
        if video?.vImageData != nil {
            print("get data from array...")
            musicImage.image = UIImage(data: video!.vImageData!)
        }
        else {
            getVideoImage(image: video!, imageView: musicImage)
            print("get images in background thread")
        }
    }
    
    func getVideoImage(image: Videos, imageView : UIImageView){
        
        DispatchQueue.global(qos: .default).async {
            
            let url = URL(string: (self.video?.vImageUrl)!)

            let data = try? Data(contentsOf: url!)

            
            var image : UIImage?
            if data != nil {
                self.video?.vImageData = data
                image = UIImage(data: data!)
            }
            
            //move back to the main queue
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }

}

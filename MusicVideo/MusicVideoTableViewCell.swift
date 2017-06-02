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
        
    }

}

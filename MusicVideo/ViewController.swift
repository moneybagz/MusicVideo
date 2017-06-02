//
//  ViewController.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 4/22/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
// CHEESE!

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = APIManager()
        api.loadData(urlString: "http://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func didLoadData(videos: [Videos]) {
        
        print(reachabilityStatus)
        
        self.videos = videos
        
        for (index, item) in videos.enumerated() {
            print("\(index) name = \(item.vName)")
        }
        
        for item in videos {
            print("name = \(item.vName)")
            print("rights = \(item.vRights)")
            print("genre = \(item.vGenre)")
            print("artist = \(item.vArtist)")
            print("image URL = \(item.vImageUrl)")
            print("imid = \(item.vImid)")
            print("link to iTunes = \(item.vLinkToiTunes)")
            print("release date = \(item.vReleaseDate)")
            print("video URL = \(item.vVideoUrl)")
            print("price = \(item.vPrice)")
        }
    }
}


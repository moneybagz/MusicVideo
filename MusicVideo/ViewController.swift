//
//  ViewController.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 4/22/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
// CHEESE!

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var displayLabel: UILabel!
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityStatusChanged), name: NSNotification.Name(rawValue: "ReachStatusChanged"), object: nil)
        
        reachabilityStatusChanged()
        
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
        
        tableView.reloadData()
    }
    
    func reachabilityStatusChanged(){
        
        switch reachabilityStatus {
        case NOACCESS: view.backgroundColor = UIColor.red
        displayLabel.text = "No Internet"
        case WIFI : view.backgroundColor = UIColor.green
        displayLabel.text = "Reachable with WIFI"
        case WWAN: view.backgroundColor = UIColor.yellow
        displayLabel.text = "Reachable with Cellular"
        default:
            return
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "ReachStatusChanged"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let video = videos[indexPath.row]
        
        cell.textLabel?.text = "\(indexPath.row + 1)"
        
        cell.detailTextLabel?.text = video.vName
        
        return cell
    }
    
    

}


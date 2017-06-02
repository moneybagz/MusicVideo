//
//  MusicVideoTVC.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 6/2/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
//

import UIKit

class MusicVideoTVC: UITableViewController {

 
    
    
    var videos = [Videos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityStatusChanged), name: NSNotification.Name(rawValue: "ReachStatusChanged"), object: nil)
        
        reachabilityStatusChanged()
        
        
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
        case NOACCESS:
            //view.backgroundColor = UIColor.red
            // move back to the main queue
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Cancel", message: "Please make sure you are connected to the internet", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
                    print("Cancel")
                })
                
                let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                    print("delete")
                })
                
                let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action) in
                    print("ok")
                })
                
                alert.addAction(okAction)
                alert.addAction(cancelAction)
                alert.addAction(deleteAction)
                
                self.present(alert, animated: true, completion: nil)
            }
            
        default:
            //view.backgroundColor = UIColor.green
            if videos.count > 0 {
                print("do not refresh api")
            }
            else {
                runAPI()
            }
        }
    }
    
    func runAPI() {
        // call api
        let api = APIManager()
        api.loadData(urlString: "http://itunes.apple.com/us/rss/topmusicvideos/limit=200/json", completion: didLoadData)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "ReachStatusChanged"), object: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let video = videos[indexPath.row]
        
        cell.textLabel?.text = "\(indexPath.row + 1)"
        
        cell.detailTextLabel?.text = video.vName
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

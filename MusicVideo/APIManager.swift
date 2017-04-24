//
//  APIManager.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 4/23/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
//

import Foundation

class APIManager {
    
    
//    func loadData(urlString: String, completion: @escaping (result: String) -> Void {
//        
//        let session = URLSession
//    }
    
    func loadData(urlString: String, completion: @escaping (_ result: String) -> Void) {
        
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        //let session = URLSession.shared
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url) { (data, response, error) -> Void in
            
            
            
            
            if error != nil {
                DispatchQueue.main.async {
                    completion((error!.localizedDescription))
                }
            }
            else {
                print(data!)
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? JSONDictionary {
                        
                        print(json)
                        

                        DispatchQueue.global(qos: .userInitiated).async {
                            
                            DispatchQueue.main.async {
                                
                                completion("Json serialization successful")
                            }
                        }
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        completion("error in json serialization")
                    }
                }
            }
            
        }
        task.resume()
    }
}

//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 4/24/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
//

import Foundation

class Videos {
    
    // Data Encapsulation
    
    private var _vName: String
    private var _vImageUrl: String
    private var _vVideoUrl: String
    
    // Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    init(data: JSONDictionary) {
        
        //If we do not initialize all properties we will get an error message
        //Return from initializer without initializing all stored properties
        
        // Video name
        if let name = data["im:name"] as? JSONDictionary, let vName = name["label"] as? String {
            self._vName = vName
        }
        else{
            // You may not always get data back from the JSON - you may want to display message "element in JSON is unexpected"
            
            _vName = ""
        }
        
        // The Video Image
        if let img = data["im:image"] as? JSONArray,
            let image = img[2] as? JSONDictionary,
            let imageString = image["Label"] as? String {
            _vImageUrl = imageString.replacingOccurrences(of: "100x100", with: "600x600")
        }
        else {
            _vImageUrl = ""
        }
        
        
        // The Video URL
        if let linkArray = data["link"] as? JSONArray,
            let linkDict = linkArray[1] as? JSONDictionary,
            let linkAttribute = linkDict["attributes"] as? JSONDictionary,
            let href = linkAttribute["href"] as? String {
            _vVideoUrl = href
        }
        else{
            _vVideoUrl = ""
        }
    }
}

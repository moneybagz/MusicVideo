//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Clyfford Millet on 4/24/17.
//  Copyright © 2017 Clyff Millet. All rights reserved.
//

import Foundation

class Videos {
    
    
    var vRank = 0
    
    // Data Encapsulation
    
    private var _vName: String
    private var _vRights: String
    private var _vPrice: String
    private var _vImageUrl: String
    private var _vArtist: String
    private var _vVideoUrl: String
    private var _vImid: String
    private var _vGenre: String
    private var _vLinkToiTunes: String
    private var _vReleaseDate: String

    // Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }

    var vArtist: String{
        return _vArtist
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }

    var vImid: String {
        return _vImid
    }

    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDate: String {
        return _vReleaseDate
    }
    
    // This variable gets created by our UI
    var vImageData:Data?
    
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
        
        // The Video Rights
        if let rights = data["rights"] as? JSONDictionary, let vRights = rights["label"] as? String {
            self._vRights = vRights
        }
        else{
            _vRights = ""
        }
        
        // The Video Price
        if let price = data["im:price"] as? JSONDictionary,
            let vPrice = price["label"] as? String {
            self._vPrice = vPrice
        }
        else{
            _vPrice = ""
        }
        
        // The Video Image
        if let img = data["im:image"] as? JSONArray,
            let image = img[2] as? JSONDictionary,
            let imageString = image["label"] as? String {
            _vImageUrl = imageString.replacingOccurrences(of: "100x100", with: "600x600")
        }
        else {
            _vImageUrl = ""
        }

        // The Video Artist
        if let artist = data["im:artist"] as? JSONDictionary,
            let vArtist = artist["label"] as? String {
            self._vArtist = vArtist
        }
        else {
            _vArtist = ""
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

        // The Video Image ID
        if let imid = data["id"] as? JSONDictionary,
            let imidAttributes = imid["attributes"] as? JSONDictionary,
            let vImid = imidAttributes["im:id"] as? String {
            _vImid = vImid
        }
        else {
            _vImid = ""
        }

        // The Video Genre
        if let genre = data["category"] as? JSONDictionary,
            let genreAttributes = genre["attributes"] as? JSONDictionary,
            let vGenre = genreAttributes["term"] as? String {
            _vGenre = vGenre
        }
        else{
            _vGenre = ""
        }
        
        // Link to itunes
        if let link = data["id"] as? JSONDictionary,
            let iLink = link["label"] as? String {
            _vLinkToiTunes = iLink
        }
        else{
            _vLinkToiTunes = ""
        }
        
        // Release Date
        if let release = data["im:releaseDate"] as? JSONDictionary,
            let releaseAttributes = release["attributes"] as? JSONDictionary,
            let vReleaseDate = releaseAttributes["label"] as? String {
            _vReleaseDate = vReleaseDate
        }
        else{
            _vReleaseDate = ""
        }
    }
}

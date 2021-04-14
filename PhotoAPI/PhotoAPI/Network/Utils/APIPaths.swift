//
//  APIPaths.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 13/4/21.
//

import Foundation


///Enum to avoid typo errors. Regiter path before use it.
enum APIPath: String, CaseIterable {
    
    case main           = "https://jsonplaceholder.typicode.com"
    case allAlbums      = "/albums"
    case allPhotos      = "/photos"
    case photosPerAlbum = "/albums/{id}/photos"
    case allUsers       = "/users"
    case albumsPerUser  = "/users/{id}/albums"
    case userById       = "/users/{id}"
    
    var path: String{ return self.rawValue }
    
}

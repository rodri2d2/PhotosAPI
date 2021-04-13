//
//  APIPaths.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 13/4/21.
//

import Foundation


///Enum to avoid typo errors. Regiter path before use it.
enum APIPath: String, CaseIterable {
    
    case main      = "https://jsonplaceholder.typicode.com/"
    case allAlbums = "/albums"
    
    var path: String{ return self.rawValue }
    
}

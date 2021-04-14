//
//  Photos.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 13/4/21.
//

import Foundation
struct Photo: Codable {
    
    let id:           Int
    let albumId:      Int
    let title:        String
    let url:          String
    let thumbnailUrl: String
}

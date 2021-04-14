//
//  AlbumPerUsers.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation

struct AlbumPerUserResquest: APIRequest {
    
    var http: HTTPMethod = .get
    var path: String
    
    typealias Response = [Album]
    
    init(userId: Int) {
        let id = String(userId)
        self.path = APIPath.albumsPerUser.path.replacingOccurrences(of: "{id}", with: id)
    }
    
}

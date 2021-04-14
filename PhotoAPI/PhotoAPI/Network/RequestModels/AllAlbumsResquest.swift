//
//  AllAlbumsResquest.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 13/4/21.
//

import Foundation


struct AllAlbumRequest: APIRequest {
    var http: HTTPMethod = .get
    var path: String     = APIPath.allAlbums.path
    typealias Response   = [Album]
}

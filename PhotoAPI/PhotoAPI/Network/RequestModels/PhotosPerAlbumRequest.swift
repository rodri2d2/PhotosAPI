//
//  PhotosPerAlbumRequest.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation


struct PhotosPerAlbumResquest: APIRequest{
    
    var http: HTTPMethod = .get
    var path: String
    
    typealias Response = [Photo]
    
    init(albumId: Int) {
        let id = String(albumId)
        self.path = APIPath.photosPerAlbum.path.replacingOccurrences(of: "{id}", with: id)
    }
    
}

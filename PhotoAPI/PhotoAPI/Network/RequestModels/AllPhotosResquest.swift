//
//  AllPhotosResponse.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation


struct AllPhotosRequest: APIRequest {
    var http: HTTPMethod = .get
    var path: String = APIPath.allPhotos.path
    typealias Response = [Photo]
}

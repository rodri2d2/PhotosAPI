//
//  AlbumDataManagerProtocol.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation


protocol AlbumDataManagerProtocol: class, ImageService {
    func fetchAllAlbums(completion: @escaping (Result<[Album]?, Error>) -> ())
    func fetchAlbumPerUser(userId:    Int, completion: @escaping (Result<[Album]?, Error>) -> ())
}

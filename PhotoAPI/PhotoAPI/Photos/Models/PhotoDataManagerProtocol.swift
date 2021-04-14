//
//  PhotoDataManagerProtocol.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation

protocol PhotoDataManagerProtocol: class, ImageService {
    func fetchAllPhotos(completion: @escaping (Result<[Photo]?, Error>) -> ())
    func fetchPhotosPerAlbum(albumId: Int, completion: @escaping (Result<[Photo]?, Error>) -> ())
}

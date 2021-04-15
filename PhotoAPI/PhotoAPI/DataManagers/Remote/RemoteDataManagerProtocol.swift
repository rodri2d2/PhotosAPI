//
//  RemoteDataManagerProtocol.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation

protocol RemoteDataManagerProtocol {
    
    func fetchAllAlbums(completion: @escaping (Result<[Album]?, Error>) -> ())
    func fetchAllPhotos(completion: @escaping (Result<[Photo]?, Error>) -> ())
    func fetchAllUsers (completion: @escaping (Result<[User]?,  Error>) -> ())
    func fetchAlbumPerUser(userId:    Int, completion: @escaping (Result<[Album]?, Error>) -> ())
    func fetchPhotosPerAlbum(albumId: Int, completion: @escaping (Result<[Photo]?, Error>) -> ())
    
    //Image Service
    func fetchImage(imageUrl: String, size: Int, completion: @escaping (Data) -> ())
}

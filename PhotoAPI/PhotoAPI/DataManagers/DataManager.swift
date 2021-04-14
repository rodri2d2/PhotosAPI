//
//  DataManager.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation


class DataManager{
    // MARK: - Class properties
    let remoteManager: RemoteDataManagerProtocol
    
    // MARK: - Lifecycle
    init(remote: RemoteDataManagerProtocol) {
        self.remoteManager = remote
    }
}
















// MARK: - Extension for AlbumDataManagerProtocol
extension DataManager: AlbumDataManagerProtocol{
    func fetchAllAlbums(completion: @escaping (Result<[Album]?, Error>) -> ()) {
        self.remoteManager.fetchAllAlbums(completion: completion)
    }
    
    func fetchAlbumPerUser(userId: Int, completion: @escaping (Result<[Album]?, Error>) -> ()) {
        self.remoteManager.fetchAlbumPerUser(userId: userId, completion: completion)
    }
    
}
















// MARK: - Extesion for Image Service
extension DataManager: ImageService{
    func fetchImage(imageUrl: String, size: String, completion: @escaping (Data) -> ()) {
    }
}
















// MARK: - Extension for PhotoDataManagerProtocol
extension DataManager: PhotoDataManagerProtocol{
    func fetchAllPhotos(completion: @escaping (Result<[Photo]?, Error>) -> ()) {
        
    }
    
    func fetchPhotosPerAlbum(albumId: Int, completion: @escaping (Result<[Photo]?, Error>) -> ()) {
        
    }
}




//
//  RemoteDataManagerImpl.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation


class RemoteDataManagerImpl{
    
    // MARK: - Class Properties
    let networkService: NetworkService
    
    // MARK: - Lifecycle
    init(service: NetworkService) {
        self.networkService = service
    }
}

















extension RemoteDataManagerImpl: RemoteDataManagerProtocol{
    
    func fetchAllAlbums(completion: @escaping (Result<[Album]?, Error>) -> ()) {
        let request = AllAlbumRequest()
        networkService.fetchData(this: request, for: completion)
    }
    
    func fetchAllPhotos(completion: @escaping (Result<[Photo]?, Error>) -> ()) {
        let request = AllPhotosRequest()
        networkService.fetchData(this: request, for: completion)
    }
    
    func fetchAllUsers(completion: @escaping (Result<[User]?, Error>) -> ()) {
        let request = AllUsersRequest()
        networkService.fetchData(this: request, for: completion)
    }
    
    func fetchAlbumPerUser(userId: Int, completion: @escaping (Result<[Album]?, Error>) -> ()) {
        let request = AlbumPerUserResquest(userId: userId)
        networkService.fetchData(this: request, for: completion)
    }
    
    func fetchPhotosPerAlbum(albumId: Int, completion: @escaping (Result<[Photo]?, Error>) -> ()) {
        let request = PhotosPerAlbumResquest(albumId: albumId)
        networkService.fetchData(this: request, for: completion)
    }
    
    func fetchImage(imageUrl: String, size: Int, completion: @escaping (Data) -> ()) {
        networkService.fetchImage(imageUrl: imageUrl, size: size, completion: completion)
    }
}

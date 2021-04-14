//
//  RemoteDataManagerImpl.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation


class RemoteDataManagerProtocolImpl{
    
    // MARK: - Class Properties
    let networkService: NetworkService
    
    // MARK: - Lifecycle
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

















extension RemoteDataManagerProtocolImpl: RemoteDataManagerProtocol{

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

}

//
//  PhotosViewModel.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 15/4/21.
//

import Foundation


class PhotosViewModel{
    
    private let dataManager: PhotoDataManagerProtocol
    var delegate:            PhotosViewModelDelegate?
    let album:       Album
    private var photosCellViewModel:      [PhotoCellViewModel] = []

    
    init(dataManager: PhotoDataManagerProtocol, album: Album) {
        self.dataManager = dataManager
        self.album = album
    }
}

















// MARK: - Data Related
extension PhotosViewModel{
    
    // MARK: - Class functionalities
    private func loadDataFromServer(){
        dataManager.fetchImagePerAlbum(albumId: self.album.id) { (result) in
         
            switch result{
            
            case .success(let response):
                if let photos = response{
                    for photo in photos{
                        self.photosCellViewModel.append(PhotoCellViewModel(photo: photo, dataManager: self.dataManager))
                    }
                    self.delegate?.didFinishLoadPhotos()
                }
            case .failure(_):
                break
            }
        }
    }
    

}

















// MARK: - View demands
extension PhotosViewModel{
    
    func  viewWasLoad() {
        loadDataFromServer()
    }
    
    func numberOfItems() -> Int{
        return photosCellViewModel.count
    }
    
    
    func cellViewModel(at indexPath: IndexPath) -> PhotoCellViewModel?{
        guard indexPath.row < photosCellViewModel.count else { return nil }
        return photosCellViewModel[indexPath.row]
    }
    
}

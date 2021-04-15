//
//  PhotosCellViewModel.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 15/4/21.
//

import Foundation


class PhotoCellViewModel{
    
    
    let photo: Photo
    var photoData: Data?
    var delegate: PhotoCellViewModelDelegate?
    
    init(photo: Photo, dataManager: PhotoDataManagerProtocol) {
        self.photo = photo
    
        dataManager.fetchImage(imageUrl: photo.thumbnailUrl, size: 150) {(data) in
            self.photoData = data
            self.delegate?.didDownloadImage()
        }
    }
    
}

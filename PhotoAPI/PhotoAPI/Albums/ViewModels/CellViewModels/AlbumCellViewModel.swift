//
//  AlbumCellViewModel.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation

class AlbumCellViewModel{
    
    // MARK: - Class properties
    let idText:      Int
    let userIdText:  Int
    let titleText:   String
    var imageData:   Data?
    let album:       Album
    let dataManager: AlbumDataManagerProtocol
    var delegate:    AlbumCellViewModelDelegate?
    
    
    
    var imageUrl: String? {
        didSet{
            
            guard let imageUrl = self.imageUrl else { return  }
            
            self.dataManager.fetchImage(imageUrl: imageUrl, size: 725) { (data) in
                self.imageData = data
                self.delegate?.didFinishLoadImage()
            }
        }
    }
    
    
    // MARK: - Lifecycle
    init(album: Album, dataManager: AlbumDataManagerProtocol) {
        self.album       = album
        self.idText      = self.album.id
        self.userIdText  = self.album.userId
        self.titleText   = self.album.title
        self.dataManager = dataManager
    }
}

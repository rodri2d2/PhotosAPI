//
//  AlbumCellViewModel.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation

class AlbumCellViewModel{
    
    // MARK: - Class properties
    let dataManager: AlbumDataManagerProtocol
    let album:       Album
    let idText:      Int
    let userIdText:  Int
    let titleText:   String
    
    // MARK: - Lifecycle
    init(album: Album, dataManager: AlbumDataManagerProtocol) {
        self.album       = album
        self.idText      = self.album.id
        self.userIdText  = self.album.userId
        self.titleText   = self.album.title
        self.dataManager = dataManager
    }
}

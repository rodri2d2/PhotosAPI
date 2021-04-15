//
//  AlbumViewModel.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation


class AlbumViewModel{
    
    // MARK: - Class properties
    private var lastLoad:    Date?
    private var albumList:   [AlbumCellViewModel] = []
    private var albumIds:    [Int]   = []
    private var imageInfo:   [Photo] = []
    let dataManager:         AlbumDataManagerProtocol
    var delegate:            AlbumViewModelDelegate?
    var imageUrl:            String?
    
    // MARK: - Lifecycle
    init(manager: AlbumDataManagerProtocol) {
        self.dataManager = manager
    }
}







// MARK: - Data Related
extension AlbumViewModel{
    
    // MARK: - Class functionalities
    private func loadDataFromServer(){
        dataManager.fetchAllAlbums { [weak self] (result) in
            guard let self = self else { return }
            
            switch result{
            //
            case .success(let response):

                if let albums = response{
                    self.prepare(albums: albums)
                }
            //
            case .failure(_):
                break
            }
        }
    }
    
    private func loadLocalData(){
        if self.albumList.count > 0{
            delegate?.didFinishLoad()
        } else {
            self.lastLoad = nil
            viewWasLoad()
        }
    }
    
    
    private func prepare(albums: [Album]){
        for album in albums{
            self.albumList.append(AlbumCellViewModel(album: album, dataManager: self.dataManager))
        }
        delegate?.didFinishLoad()
    }
   
    
    private func loadImages(indexPath: IndexPath){
        
        let albumId = albumList[indexPath.row].idText
        if !albumIds.contains(albumList[indexPath.row].idText){
            albumIds.append(albumId)
            downloadPhotoInfo(indexPath: indexPath, albumId: albumId)
        } else {
            
            albumList[indexPath.row].imageUrl = imageInfo[indexPath.row].url
            
        }
    }
    
    private func downloadPhotoInfo(indexPath: IndexPath, albumId: Int){
        dataManager.fetchImagePerAlbum(albumId: albumId) { [self] (result) in
            switch result {
            case .success(let response):
                guard let response = response else { return  }
                imageInfo.append(contentsOf: response)
                albumList[indexPath.row].imageUrl = response.randomElement()?.url
            case .failure(_):
                break
            }
        }
    }
    
    private func prepareImage(image: [Photo]){
        self.imageInfo.append(contentsOf: image.map({ $0 }))
    }
}








// MARK: - View demands
extension AlbumViewModel{
    
    func viewWasLoad() {
        
        if lastLoad == nil {
            lastLoad = Date()
            loadDataFromServer()
        }else{
            let expirationTime: TimeInterval = 60 * 10
            guard let lastLoad = self.lastLoad else {  return }
            if Date().timeIntervalSince(lastLoad) < expirationTime {
                loadLocalData()
            }
        }
    }
    

    
    func numberOfItems() -> Int{
        return albumList.count
    }
    
    
    func cellViewModel(at indexPath: IndexPath) -> AlbumCellViewModel?{
        guard indexPath.row < albumList.count else { return nil }
        loadImages(indexPath: indexPath)
        return albumList[indexPath.row]
    }
    
}

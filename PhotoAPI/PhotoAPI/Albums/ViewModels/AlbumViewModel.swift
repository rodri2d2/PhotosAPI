//
//  AlbumViewModel.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation


class AlbumViewModel{
    
    // MARK: - Class properties
    var lastLoad:    Date?
    let dataManager: AlbumDataManagerProtocol
    var delegate:    AlbumViewModelDelegate?
    var albumList:   [AlbumCellViewModel] = []
    
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
        return albumList[indexPath.row]
    }
    
}

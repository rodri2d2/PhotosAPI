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

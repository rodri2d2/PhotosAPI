//
//  ImageServiceProtocol.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation

protocol ImageService {
    func fetchImage(imageUrl: String, size: String, completion: @escaping (_ imageData: Data)-> ())
}


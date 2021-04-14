//
//  SingleUserRequest.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation

class UserByIdRequest: APIRequest{
    var http: HTTPMethod = .get
    var path: String
    typealias Response = [User]
    
    init(userId: Int) {
        let id = String(userId)
        self.path = APIPath.userById.path.replacingOccurrences(of: "{id}", with: id)
    }
}

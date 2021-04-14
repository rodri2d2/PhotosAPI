//
//  AllUsersRequest.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import Foundation

struct AllUsersRequest: APIRequest{
    
    var http: HTTPMethod = .get
    var path: String = APIPath.allUsers.path
    
    typealias Response = [User]
    
    
}

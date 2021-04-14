//
//  HTTPMethods.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 13/4/21.
//

import Foundation
enum HTTPMethod: String{
    case get  = "GET"
    case post = "POST"
    //
    var method: String{ return self.rawValue }
}

//
//  Responses.swift
//  PhotoAPI
//
//  Created by Rodrigo  Candido on 14/4/21.
//




/*
 
 In a real life situation JSON response from Server should conforms a sort of
 object.
 With https://jsonplaceholder.typicode.com response the object type array is returned directly
 
 So, for this particular case. The model itself comform directly with associatedtype on APIRequest protocol. However, its implementation should be a array of model
 
 
 e.g.: For a normal implementation
 
 struct AllAlbumRequest: APIRequest {
    var http: HTTPMethod = .get
    var path: String     = APIPath.allAlbums.path
    typealias Response   = AlBumResponse
 }
 
 struct AlBumResponse: Codable {
    let albums: [Album]
 }
 
 
 e.g.: For array direct response
 struct AllAlbumRequest: APIRequest {
    var http: HTTPMethod = .get
    var path: String     = APIPath.allAlbums.path
    typealias Response   = [Album]
 }
 
 
 
 */

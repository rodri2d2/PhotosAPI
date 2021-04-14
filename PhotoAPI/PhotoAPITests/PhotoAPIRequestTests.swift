//
//  PhotoAPITests.swift
//  PhotoAPITests
//
//  Created by Rodrigo  Candido on 14/4/21.
//

import XCTest

// MARK: - TESTABLE modules
@testable import PhotoAPI

class PhotoAPIRequestTests: XCTestCase {
    
    let notParsedMessage = "Data received but not parsed correctly"
    let timeOut: TimeInterval = 3
    var networkService: NetworkService!
    var expectation: XCTestExpectation!
    
    override func setUp() {
        networkService = NetworkService()
        expectation = expectation(description: "Server responds")
    }
    
    
    func test_Album_IfReceivedDataFromServerCanBeDecoded(){
        
        let request = AllAlbumRequest()
        networkService.fetchData(this: request) { (result) in
            self.expectation.fulfill()
            switch result {
                case .success(let response):
                    XCTAssert(response!.count > 0)
                case .failure(_):
                    XCTFail(self.notParsedMessage)
            }
        }
        waitForExpectations(timeout: timeOut)
    }
    
    
    func test_Photos_IfReceivedDataFromServerCanBeDecoded() {
        let request = AllPhotosRequest()
        networkService.fetchData(this: request) { (result) in
            self.expectation.fulfill()
            switch result {
                case .success(let response):
                    XCTAssert(response!.count > 0)
                case .failure(_):
                    XCTFail(self.notParsedMessage)
            }
        }
        
        waitForExpectations(timeout: timeOut)
    }


    func test_PhotosPerAlbum_IfReceivedDataFromServerCanBeDecoded(){
        let request = PhotosPerAlbumResquest(albumId: 3)

        networkService.fetchData(this: request) { (result) in
            self.expectation.fulfill()
            switch result {
                case .success(let response):
                    XCTAssertEqual(response?.first?.albumId, 3)
                case .failure(_):
                    XCTFail(self.notParsedMessage)
            }
        }
        waitForExpectations(timeout: timeOut)
    }
    
    func test_Users_IfReceivedDataFromServerCanBeDecoded(){
        let request = AllUsersRequest()
        networkService.fetchData(this: request) { (result) in
            self.expectation.fulfill()
            switch result{
            
            case .success(let response):
                XCTAssert(response!.count > 0)
            case .failure(_):
                XCTFail(self.notParsedMessage)
            }
        }
        waitForExpectations(timeout: timeOut)
    }
    
    
    func test_AlbumPerUser_IfReceivedDataFromServerCanBeDecoded(){
        
        let request = AlbumPerUserResquest(userId: 1)
        networkService.fetchData(this: request) { (result) in
            self.expectation.fulfill()
            switch result{
            case .success(let response):
                XCTAssertEqual(response?.first?.userId, 1)
            case .failure(_):
                XCTFail(self.notParsedMessage)
            }
        }
        
        waitForExpectations(timeout: timeOut)
        
        
    }
    
}

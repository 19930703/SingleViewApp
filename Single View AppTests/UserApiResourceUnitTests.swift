//
//  UserApiResourceUnitTests.swift
//  Single View AppTests
//
//  Created by Vijay Bhaskar on 16/05/21.
//

import XCTest
//1
@testable import Single_View_App

class UserApiResourceUnitTests: XCTestCase {
    
    //2
    var serviceModel : ServiceModel!
    var session: URLSessionMock!

    // 3
    override func setUp() {
        session = URLSessionMock()
        serviceModel = ServiceModel(session: session)

        super.setUp()
    }
    
    // End
    override func tearDown() {
        session = nil
        serviceModel = nil
        super.tearDown()
    }
    
    /// check with invalid url
    func test_With_Invalid_URL(){
        // 1
        session.data = nil
        // 2
        let expectation = self.expectation(description: "Users API Call Expectation")
        // 3
        serviceModel.request("vijayTestUrl", nil, .GET, headers: nil, objectType: [User].self) { (results, error) in
            
            //4
            XCTAssertNotNil(error)  // error should not be nil
            XCTAssertTrue(error is APIError)  // error should be APi error
            switch (error as! APIError) {
                case .apiError(let message):
                    XCTAssertEqual(message, "Invalid URL")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)

    }
    
    
    func test_UserList_Valid_URL_Successfull_Data(){
        
        // 1
        let users = [User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: Address(street: "Kulas", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: Geo(lat: "-32.434234", lng: "-77.4343")), phone: "1-770-736-8031 x56442", website: "hildegard.org", company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets"), isStar: false)]
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(users)
        //2
        session.data = data
        
        let expectation = self.expectation(description: "Users API Call Expectation")
        
        // 3
        serviceModel.request(UrlModule.usersListUrl(), nil, .GET, headers: nil, objectType: [User].self) { (results, error) in

            guard error == nil else {
                // If network is not available or when url is not valid
                XCTAssertNil(error)  // Error shoud be nil
                return
            }

            XCTAssertEqual(results, users, "Api result should be matched with declared users data")
            expectation.fulfill()

        }

        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func test_UserList_Failed_Response() {
        
        session.data = nil
        
        let expectation = self.expectation(description: "User API Call Expectation")
        
        serviceModel.request(UrlModule.usersListUrl(), nil, .GET, headers: nil, objectType: [User].self) { (results, error) in
            
            
            XCTAssertNil(results, "The api result should return nil data")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }


}

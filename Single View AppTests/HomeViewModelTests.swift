//
//  HomeViewModelTests.swift
//  Single View AppTests
//
//  Created by Vijay Bhaskar on 16/05/21.
//

import XCTest
//1
@testable import Single_View_App

class HomeViewModelTests: XCTestCase {
    
    //2
    var viewModel : HomeViewModel! = nil
    
    var users = [
        User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: Address(street: "Kulas", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: Geo(lat: "-32.434234", lng: "-77.4343")), phone: "1-770-736-8031 x56442", website: "hildegard.org", company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets"), isStar: false),
        User(id: 2, name: "Ervin", username: "Antonette", email: "Shanna@melissa.tv", address: Address(street: "Victor", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3526", geo: Geo(lat: "-32.264561", lng: "-99.45646")), phone: "1-770-736-8031 x56442", website: "vokaufdn.org", company: Company(name: "Proactive-Crona", catchPhrase: "erver neural-net", bs: "harness real-tim"), isStar: true)
    ]
    
    override func setUp() {
        //3
        viewModel = HomeViewModel()
        super.setUp()
    }
    override func tearDown() {
        viewModel = nil
        super.tearDown()
        
    }
    
    //ISOLATE AND TEST THE STAR RETRIVED DATA FROM SERVER AND FILTERED DATA [DISPLAYING ON THE SCREEN DATA] SAME OR NOT

    func test_UserList_And_DisplayingData_Equal_Or_Not() throws {
        
        let usersList = viewModel.seperateDisplayListOfData(users)
        
        for (index, displayUser) in usersList.enumerated() {
            
            let user = users[index]
            
            XCTAssertEqual(displayUser.id, user.id!)
            XCTAssertEqual(displayUser.name, user.name!)
            XCTAssertEqual(displayUser.phone, user.phone!)
            XCTAssertEqual(displayUser.website, user.website!)
            XCTAssertEqual(displayUser.company, user.company?.name!)
            XCTAssertEqual(displayUser.isStar, user.isStar!)

            
        }
        
    }
    
    //ISOLATE AND TEST THE STAR SAVING CORRECTLY OR NOT

    func test_Star_With_True() throws {
        viewModel.userMarked(isStar: true, id: 0)
        
        let usersList = viewModel.seperateDisplayListOfData(users)
        
        for (index, displayUser) in usersList.enumerated() {
            
            let user = users[index]
            
            XCTAssertEqual(displayUser.isStar, user.isStar!)

            
        }
        
    }
    
    //ISOLATE AND TEST THE STAR SAVING CORRECTLY OR NOT
    
    func test_Star_With_False() throws {
        viewModel.userMarked(isStar: false, id: 0)
        
        let usersList = viewModel.seperateDisplayListOfData(users)
        
        for (index, displayUser) in usersList.enumerated() {
            
            let user = users[index]
            
            XCTAssertEqual(displayUser.isStar, user.isStar!)

            
        }
        
    }
    
    
    
    
}

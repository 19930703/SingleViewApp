//
//  UserDetailsViewModelTests.swift
//  Single View AppTests
//
//  Created by Vijay Bhaskar on 16/05/21.
//

import XCTest
// 1
@testable import Single_View_App

class UserDetailsViewModelTests: XCTestCase {
    //2
    var viewModel : UserDetailsViewModel! = nil
    
    var user = User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: Address(street: "Kulas", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: Geo(lat: "-32.434234", lng: "-77.4343")), phone: "1-770-736-8031 x56442", website: "hildegard.org", company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets"), isStar: false)
    
    override func setUp() {
        //3
        viewModel = UserDetailsViewModel()
        super.setUp()
    }
    
    override func tearDown() {
        // Finally
        viewModel = nil
        super.tearDown()
    }
    
    
    func test_all_data_matches(){
        viewModel.user = user
        viewModel.getData()
        
        XCTAssertEqual(viewModel.fullAddress, "\(user.address?.suite ?? ""), \(user.address?.street ?? ""), \(user.address?.city ?? "") - \(user.address?.zipcode ?? "")")
        
    }
    
    func test_check_Making_Star_True_Or_False(){
        
        viewModel.user = user
        
        // CHECKING TRUE CASE
        viewModel.starUser(markStar: true)
        var isStar = viewModel.user?.isStar ?? false
        XCTAssertTrue(isStar)
        
        
        // CHECKING FALSE CASE
        viewModel.starUser(markStar: false)
        isStar = viewModel.user?.isStar ?? false
        XCTAssertFalse(isStar)
        
    }
    
    /// Star text should be visible when user makes star
    func test_Checking_Star_Text(){
        //1
        viewModel.user = user
        // 2. Make star
        viewModel.starUser(markStar: true)
        let isStar = viewModel.user?.isStar ?? false
        XCTAssertTrue(isStar)
        
        //3 check star text
        XCTAssertEqual(viewModel.showStarText.value, "Star ⭐")
        
    }
    


}

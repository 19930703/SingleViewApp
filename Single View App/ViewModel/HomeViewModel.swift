//
//  HomeViewModel.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import Foundation
class HomeViewModel: UserStarProtocol {
    
    private let serviceModel = ServiceModel() // Initialize ServiceModel

    // Initialize Objects
    var users: [User] = []
    var usersList: Observable<[HomeViewModel.DisplayUserData]> = Observable([])
    
    var networkError: Observable<Error?> = Observable(nil)

    func fetchAllUsers(){
        
        print(UrlModule.usersListUrl())
        /*
         1. url = "https://jsonplaceholder.typicode.com/users"
         2. HttpBody = "GET"
         3. No need to pass parameters and headers
         4. objectType is [User].self
         */
        
        serviceModel.request(UrlModule.usersListUrl(), nil, .GET, headers: nil, objectType: [User].self) { [weak self] (users, error) in
            
            guard error == nil else {
                // If network is not available or when url is not valid
                self?.networkError.value = error
                return
            }
            
            self?.users = users ?? []
            self?.usersList.value = self?.seperateDisplayListOfData(users ?? []) ?? []
        }

    }
    
    
    func seperateDisplayListOfData(_ userData: [User]) -> [HomeViewModel.DisplayUserData]{
        
        var seperatedData : [HomeViewModel.DisplayUserData] = []
        
        userData.forEach { user in

            seperatedData.append(HomeViewModel.DisplayUserData(id: user.id ?? 0, name: user.name ?? "", phone: user.phone ?? "", website: user.website ?? "", company: user.company?.name ?? "", isStar: user.isStar ?? false))
        }
        return seperatedData
        
    }
    
    
    // MARK: MARK USER AS STAR PROTOCOL
    func userMarked(isStar: Bool, id: Int) {
        
        for index in 0..<users.count {
            if users[index].id == id {
                users[index].isStar = isStar
                break
            }
        }
        usersList.value = seperateDisplayListOfData(users)
        usersList.update()
    }
}

extension HomeViewModel{
    
    struct DisplayUserData {
        var id:Int
        var name:String
        var phone:String
        var website: String
        var company: String
        var isStar:Bool
    }
}



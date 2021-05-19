//
//  UsersListResponse.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import Foundation

// MARK: - UserElement
struct User: Codable {
    
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
    var isStar: Bool?
    
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}
// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}

// For test cases
extension User:Equatable{
    
    static func == (lhs: User, rhs: User) -> Bool {
        
        return (
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.username == rhs.username &&
            lhs.email == rhs.email &&
            lhs.phone == rhs.phone &&
            lhs.website == rhs.website
        )
    }
}

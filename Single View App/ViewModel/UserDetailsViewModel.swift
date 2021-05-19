//
//  UserDetailsViewModel.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import Foundation

class UserDetailsViewModel {
    
    // Declaring Objects
    var user: User?
    var fullAddress:String?
    var showStarText: Observable = Observable("")
    
    func getData(){
        
        // Adding multiple string values using String Interpolation
        fullAddress = "\(user?.address?.suite ?? ""), \(user?.address?.street ?? ""), \(user?.address?.city ?? "") - \(user?.address?.zipcode ?? "")"
        updateStar()
    }
    
    
    /// get the value based on isStar. "Star ⭐" when its true. Its emptry wheb its false
    func updateStar(){
        
        let starText = (user?.isStar ?? false) ? "Star ⭐" : ""
        showStarText.value = starText
    }
    
    /// Update the isStar value in the user object
    /// - Parameter markStar: its true when seleted and its false when unselected
    func starUser(markStar: Bool) {
        
        user?.isStar = markStar
        updateStar()
    }
    
}

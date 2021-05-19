//
//  AppModel.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import Foundation
func parseJsonFrom(data: Data) -> [String: Any]? {
    do {
        let JSON = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        return JSON
    } catch {
        //print(error.localizedDescription)
    }
    return nil
}

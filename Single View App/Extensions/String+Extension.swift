//
//  String+Extension.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import Foundation
extension String {
    
    func getURlEncodedString() -> String? {
        let percentencodedurlString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return percentencodedurlString
        
    }
    
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}

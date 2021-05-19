//
//  ServiceModel.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import Foundation

/// List of nectwork calling HTTP method types
enum HttpMethodType : String {
    case GET = "GET"
    case POST = "POST"
}

enum APIError: Error {
    case apiError(message: String)
}


class ServiceModel {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(_ url: String, _ params: [String: Any]? = nil, _ methodType: HttpMethodType, headers: [String: String]? = nil, objectType: T.Type, completion: @escaping (_ response : T?, _ error:Error?) -> ()) {
        
        
        let request = baseRequest(urlStr: url, methodType: methodType, params, headers)
        
        guard let url = request.url, url.absoluteString.isValidURL else {
            // If url is not valid
            completion(nil, APIError.apiError(message: "Invalid URL"))
            return
        }
        
        session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(nil, error)
                    return
                }
                
                let values = try? JSONDecoder().decode(objectType.self, from: data)
                completion(values, nil)
            }
            
            
        }.resume()
        
    }
    
    
    private func baseRequest(urlStr: String, methodType: HttpMethodType, _ params: [String: Any]? = nil, _ headers: [String: String]? = nil) -> URLRequest{
        
        var request = URLRequest.init(url: URL(string: urlStr.getURlEncodedString()!)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
        request.httpMethod = methodType.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if params != nil {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params!, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        

        if headers != nil {
            for (key, value) in headers! {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
        
    }
    
}



//
//  NetworkCall.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 06/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkCall {
    func fetchData(using request: String,completion: @escaping (Data?, Error?) -> Void)
}

class AFWrapper: NetworkCall {
     static let sharedInstance = AFWrapper()
     let  url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    func fetchData(using request: String,completion: @escaping (Data?, Error?) -> Void){
        AF.request(url).response { (response) in
            completion(response.data, response.error)
        }
    }
}

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

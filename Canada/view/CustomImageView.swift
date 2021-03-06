//
//  CustomImageView.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 06/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//

import Foundation
import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()
class CustomImageView:UIImageView {
    var imageUrlString:String?
    
    func loadImageUsingUrlString(urlString:String) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        guard let imageUrl = url else { return }
        let request = URLRequest(url: imageUrl)
        URLSession.shared.dataTask(with: request) { (data, respone, error) in
            if error != nil {
                return
            }
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: imageData)
                guard let imgToCache = imageToCache else { return }
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imgToCache, forKey: urlString as AnyObject)
            }
            
            }.resume()
    }
}

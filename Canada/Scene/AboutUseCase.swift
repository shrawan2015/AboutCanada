//
//  AboutUseCase.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 05/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//
import Foundation
class AboutUseCase:BaseUseCase<AboutList.FetchAboutCanada.Request, AboutList.FetchAboutCanada.Response> {
    override func getRequest(request: AboutList.FetchAboutCanada.Request?, completionHandler: @escaping (AboutList.FetchAboutCanada.Response?, Error?) -> Void) {
        AFWrapper.sharedInstance.fetchData(using:""){ data,error in
            if(error != nil){
                completionHandler(nil,error)
                return
            }
               do {
                let responseStrInISOLatin = String(data: data!, encoding: String.Encoding.windowsCP1252)
                guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf16) else {
                      return
                 }
                let resultModel = try JSONDecoder().decode(Canada.self, from: modifiedDataInUTF8Format)
                let response = AboutList.FetchAboutCanada.Response(results: resultModel)
                completionHandler(response,nil)
                return
            }  catch let exception {
                     completionHandler(nil,exception)
            }
        }
    }
    
}


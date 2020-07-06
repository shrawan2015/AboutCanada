//
//  AboutPresenter.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 05/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//

import Foundation

protocol AboutPresentationLogic {
    func presentAboutResponse(response: AboutList.FetchAboutCanada.Response?, error:Error?)
}

class AboutPresentor:AboutPresentationLogic{
    func presentAboutResponse(response: AboutList.FetchAboutCanada.Response?, error:Error?){
        if error != nil {
            viewController?.displayError(error?.localizedDescription ?? "")
        }else {
            guard let results = response?.results else{
                 viewController?.displayError(error?.localizedDescription ?? "")
                                return
            }
            let displayedAbout = AboutList.FetchAboutCanada.ViewModel.DisplayedAbout(title: results.title, rows: results.rows)
            viewController?.showAbout(displayedAbout)
        }
    }
    
    weak var viewController:AboutViewController?
}

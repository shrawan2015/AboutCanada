//
//  AboutInteractor.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 05/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//

import Foundation

protocol AboutDataStore{
    var about: AboutList.FetchAboutCanada.ViewModel?{ get }
}

protocol AboutBusninessLogic {
    func fetchAbout()
}

class AboutInteractor : AboutBusninessLogic,AboutDataStore{
    var presenter:AboutPresentor?
    var about:AboutList.FetchAboutCanada.ViewModel?
    func fetchAbout(){
        let request = AboutList.FetchAboutCanada.Request()
    AboutUseCase.service(request: request) { [weak self] (response, error) in
                self?.presenter?.presentAboutResponse(response: response, error: error)
        }
    }

}

//
//  AboutModel.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 05/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//


import Foundation

struct Canada: Codable {
    let title:String?
    let rows: [About]?
}

struct About: Codable {
    let title: String?
    let imageHref:String?
    let description:String?
}

struct AboutRequest {
}
struct AboutResponse{
}

struct AboutViewModel{
}
 

enum AboutList
{
  // MARK: Use cases
  enum FetchAboutCanada
  {
    struct Request
    {
    }
    struct Response
    {
        let results: Canada?
    }
    struct ViewModel
    {
      struct DisplayedAbout
      {
       let title:String?
       let rows: [About]?
      }
      var displayedAbout: DisplayedAbout?
    }
  }
}

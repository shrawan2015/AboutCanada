//
//  BaseVC.swift
//  Tinder
//
//  Created by ShrawanKumar Sharma on 27/06/20..
//  Copyright © 2020 Shrawan. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.extendedLayoutIncludesOpaqueBars = true
        print("Screen Name \(self)")
        showNavigationShadow()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
}

extension BaseVC {
    
    func hideNavigationShadow() {
        self.navigationController?.navigationBar.layer.cornerRadius = 0
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.clear.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.navigationController?.navigationBar.layer.shadowRadius = 0.0
    }
    
    func showNavigationShadow() {
        self.navigationController?.navigationBar.layer.cornerRadius = 6
        self.navigationController?.navigationBar.layer.shadowColor = #colorLiteral(red: 0.13, green: 0.13, blue: 0.13, alpha: 0.24)
        self.navigationController?.navigationBar.layer.shadowOpacity = 1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.navigationController?.navigationBar.layer.shadowRadius = 4
    }
}

//
//  AboutViewController.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 05/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//

import UIKit
protocol AboutDisplayLogic{
    func displayError(_ error: String)
    func showAbout(_ about:AboutList.FetchAboutCanada.ViewModel.DisplayedAbout)
}

class AboutViewController: BaseVC {
    @IBOutlet weak var errorMessage: ErrorMessage!
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    private var interactor:AboutInteractor?
    private let cellID = "AboutTableViewCell"
    private var abouts:AboutList.FetchAboutCanada.ViewModel.DisplayedAbout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    final func setUp(){
        tableView.dataSource = self
        let nib = UINib.init(nibName: cellID, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier:cellID)
        self.tableView.tableFooterView = UIView()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        interactor?.fetchAbout()
        self.errorMessage.delegate = self
        
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        interactor?.fetchAbout()
    }
    
    
    // MARK:- Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupDependencyConfigurator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDependencyConfigurator()
    }
}

extension AboutViewController:AboutDisplayLogic{
    final func displayError(_ error: String){
        self.errorMessage.isHidden = false
        self.tableView.isHidden = true
    }
    
   final func showAbout(_ about:AboutList.FetchAboutCanada.ViewModel.DisplayedAbout){
        DispatchQueue.main.async {
            self.title = about.title
            self.abouts = about
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.errorMessage.isHidden = true
            self.tableView.isHidden = false
        }
    }
}
// MARK:- Configuration Logic
extension AboutViewController {
    fileprivate func setupDependencyConfigurator() {
        let interactor = AboutInteractor()
        let presenter = AboutPresentor()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }
}


extension AboutViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.abouts?.rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:cellID, for: indexPath) as! AboutTableViewCell
        if let rows = self.abouts?.rows{
            cell.about =  rows[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



extension AboutViewController : ReConnect{
    final func reConnect(){
        interactor?.fetchAbout()
    }
}

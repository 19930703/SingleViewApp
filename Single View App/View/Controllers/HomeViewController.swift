//
//  HomeViewController.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARKS:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadingView.showLoader(in: self)      // Initiaize loader
        bindViews()
        viewModel.fetchAllUsers()  // calling service to fetching all users list of data
        
    }
    
    // MARK: BINDING VIEWS
    func bindViews() {
        
        viewModel.usersList.bind { [weak self] usersList in
            // this observer will called whenever values updated or changed
            
            LoadingView.hideLoader()
            self?.tableView.reloadData()
        }
        
        viewModel.networkError.bind { [weak self] error in
            if let _ = error {
                self?.showDefaultAlertWith(title: ErrorMessages.errorTitle, message: ErrorMessages.somthingWentWrong)

            }
        }
        
    }


}

// MARK: TABLEVIEW DELEGATE && DATASOURCE
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as! UserTableViewCell
        cell.user = viewModel.users[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.userDetailsVc) as! UserDetailsVc
        vc.user = viewModel.users[indexPath.row]
        vc.starDelegate = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}


//
//  UserDetailsVc.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import UIKit

class UserDetailsVc: UIViewController {
    
    // MARKS:- IBOutlet
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblCompanyName: UILabel!
    @IBOutlet var lblPhone: UILabel!
    @IBOutlet var lblWebsite: UILabel!
    @IBOutlet var lblStar: UILabel!

    var btnStar = UIButton()

    // MARKS:- Properties
    private let viewModel = UserDetailsViewModel()
    var user: User?
    var starDelegate: UserStarProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.user = user
        viewModel.getData()
        setupUI()
        updateUserDetails()
        // Do any additional setup after loading the view.
    }
    
    // MARK: setupUI
    /// Adding Right bar Button to navigationItem for showing slected star or empty star
    func setupUI() {
        
        btnStar =  UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0))
        btnStar.setImage(UIImage(named: "emprty_star"), for: .normal)
        btnStar.setImage(UIImage(named: "fill_star"), for: .selected)
        btnStar.addTarget(self, action: #selector(btnStarClicked), for: .touchUpInside)
        btnStar.isSelected = viewModel.user?.isStar ?? false
        let barButton = UIBarButtonItem(customView: btnStar)
        navigationItem.rightBarButtonItem = barButton
        
        btnStar.isAccessibilityElement = true
        btnStar.accessibilityIdentifier = "btnStar"
        btnStar.accessibilityLabel = "btnStar"
        
    }
    
    private func updateUserDetails(){
        
        lblName.changeTextStyle("Name: ", user?.name ?? "")
        lblUserName.changeTextStyle("User Name: ", user?.username ?? "")
        lblAddress.changeTextStyle("Address: ", viewModel.fullAddress ?? "")
        lblCompanyName.changeTextStyle("Company Name: ", user?.company?.name ?? "")
        lblPhone.changeTextStyle("Phone: ", user?.phone ?? "")
        lblWebsite.changeTextStyle("Website: ", user?.website ?? "")
        viewModel.showStarText.bind { [weak self] starText in
            // This observer will call whenever updates happen on the star selection
            self?.lblStar.text = starText
        }

    }
    
    // MARK: MARK USER AS STAR
    /// 1. Changing the star image when click on right bar button on the navigation item
    /// 2. Updating the star value. [full star image when selected, Empty srat when unselected]
    @objc func btnStarClicked() {
        
        btnStar.isSelected = !btnStar.isSelected
        viewModel.starUser(markStar: btnStar.isSelected)

        guard let id = viewModel.user?.id else {
            return
        }
        starDelegate?.userMarked(isStar: btnStar.isSelected, id: id)
    }
    

}

//
//  UserTableViewCell.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // MARKS:- IBOutlet
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPhone: UILabel!
    @IBOutlet var lblWebsite: UILabel!
    @IBOutlet var lblCompanyName: UILabel!
    @IBOutlet weak var imageStar: UIImageView!
    
    // MARKS:- Properties
    
    static let identifier = "UserTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    var user:User? = nil{
        didSet{
            
            lblName.changeTextStyle("Name: ",user?.name ?? "")
            lblPhone.changeTextStyle("Phone: ", user?.phone ?? "")
            lblWebsite.changeTextStyle("Website: ", user?.website ?? "")
            lblCompanyName.changeTextStyle("Company: ", user?.company?.name ?? "")
            
            imageStar.isHidden = user?.isStar ?? false ? false : true
            
            
        }
    }

}

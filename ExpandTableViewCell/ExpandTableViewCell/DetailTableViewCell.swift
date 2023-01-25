//
//  DetailTableViewCell.swift
//  ExpandTableViewCell
//
//  Created by chaitanya on 1/24/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    // Empty Clousure
    
    var butttonClicked: (() -> (Void))!
    
    
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func moreBtnTapped(_ sender: Any) {
        // Clousure Calling
        butttonClicked()
    }
    
}

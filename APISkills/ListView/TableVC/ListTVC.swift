//
//  ListTVC.swift
//  APISkills
//
//  Created by apple on 01/05/24.
//

import UIKit

class ListTVC: UITableViewCell {
    
    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var lblTitle:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

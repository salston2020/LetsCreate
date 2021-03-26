//
//  CustomCellTableViewCell.swift
//  LetsCreate9
//
//  Created by Sheena Alston on 3/25/21.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var postCell: UIView!
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var jobType: UILabel!
    
    @IBOutlet weak var publisherName: UILabel!
    
    @IBOutlet weak var dateOfService: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  peopleTableViewCell.swift
//  tableview
//
//  Created by ธนัท แสงเพิ่ม on 7/10/2564 BE.
//

import UIKit

class peopleTableViewCell: UITableViewCell {

    @IBOutlet weak var peopleview: UIView!
    @IBOutlet weak var peoplename: UILabel!
    @IBOutlet weak var peepleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

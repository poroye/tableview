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
    @IBOutlet weak var peoplePosition: UILabel!
    @IBOutlet weak var peopleTelephone: UILabel!
    @IBOutlet weak var peopleMobilephone: UILabel!
    @IBOutlet weak var peopleEmail: UILabel!
    @IBOutlet weak var peopleNavdate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIImageView {
    func makeRounded() {
        self.layer.borderWidth = 2
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

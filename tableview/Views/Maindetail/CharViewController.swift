//
//  CharViewController.swift
//  tableview
//
//  Created by ธนัท แสงเพิ่ม on 8/10/2564 BE.
//

import UIKit

class CharViewController: UIViewController {

    @IBOutlet weak var whiteView: UIView!
    
    var imageValue: String?
    var engNameValue: String?
    var thaiNameValue: String?
    var copValue: String?
    var telValue: String?
    var inTelValue: String?
    var mTelValue: String?
    var emailValue: String?
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var engName: UILabel!
    @IBOutlet weak var thaiName: UILabel!
    @IBOutlet weak var cop: UILabel!
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var inTel: UILabel!
    @IBOutlet weak var mTel: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("charViewDidLoad")
        imageProfile.image = imageValue?.load()
        imageProfile.makeRounded()
        engName.text = engNameValue
        thaiName.text = thaiNameValue
        cop.text = copValue
        tel.text = telValue
        inTel.text = inTelValue
        mTel.text = mTelValue
        email.text = emailValue
        whiteView.layer.cornerRadius = 10
    }
    
    @IBAction func backButtonPress(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//
//  model.swift
//  tableview
//
//  Created by ธนัท แสงเพิ่ม on 7/10/2564 BE.
//

import UIKit

extension String{
    func load() -> UIImage{
        do{
            guard let url = URL(string:self)else{
                return UIImage() //empty image
            }
            let data:Data = try Data(contentsOf: url)
            return UIImage(data:data) ?? UIImage()
        }catch{return UIImage()}
    }
}

struct peoplelist:Codable{
    var results:[people]
}

struct people:Codable{
    let name:String
    let position:String
    let telOrgList:[String]
    let mobileList:[String]
    let emailGov:String
    let nav_date:String
    let imageProfileUrl:String
}

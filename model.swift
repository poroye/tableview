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

func strToDate(strDate:String) -> Date{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    let dateFromString = dateFormatter.date(from: strDate)
    return dateFromString ?? Date()
}

func dateToStr(datetoConvert:Date)->String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    let stringDate = dateFormatter.string(from: datetoConvert)
    return stringDate
}

func fixStrDate(dateStr:String) -> String{
    return dateToStr(datetoConvert: strToDate(strDate: dateStr))
}

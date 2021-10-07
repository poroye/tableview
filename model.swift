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
    let date = stringDate.split(separator: "-")
    var day = date[0]
    if date[0].hasPrefix("0"){
        day = date[0].suffix(1)
    }
    switch date[1]{
    case "01":
        return "\(day) มกราคม \(date[2])"
    case "02":
        return "\(day) กุมภาพันธ์ \(date[2])"
    case "03":
        return "\(day) มีนาคม \(date[2])"
    case "04":
        return "\(day) เมษายน \(date[2])"
    case "05":
        return "\(day) พฤษภาคม \(date[2])"
    case "06":
        return "\(day) มิถุนายน \(date[2])"
    case "07":
        return "\(day) กรกฎาคม \(date[2])"
    case "08":
        return "\(day) สิงหาคม \(date[2])"
    case "09":
        return "\(day) กันยายน \(date[2])"
    case "10":
        return "\(day) ตุลาคม \(date[2])"
    case "11":
        return "\(day) พฤศจิกายน \(date[2])"
    case "12":
        return "\(day) ธันวาคม \(date[2])"
    default:
        return "date err"
    }
}

func fixStrDate(dateStr:String) -> String{
    return dateToStr(datetoConvert: strToDate(strDate: dateStr))
}

//
//  model.swift
//  tableview
//
//  Created by ธนัท แสงเพิ่ม on 7/10/2564 BE.
//

import Foundation

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

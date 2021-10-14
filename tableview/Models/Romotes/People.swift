//
//  People.swift
//  tableview
//
//  Created by ธนัท แสงเพิ่ม on 14/10/2564 BE.
//

import Foundation

struct People:Codable{
    let name:String
    let nameEng:String
    let orgNameWbs:String
    let position:String
    let telOrgList:[String]
    let telOrgExt:String
    let mobileList:[String]
    let emailGov:String
    let nav_date:String
    let imageProfileUrl:String
}

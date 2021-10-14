//
//  Repository.swift
//  tableview
//
//  Created by ธนัท แสงเพิ่ม on 14/10/2564 BE.
//

import Foundation
import Alamofire

class Repository{
    class func fetchAlamo(onSuccuss: @escaping (Peoplelist) -> Void){
           AF.request("https://jsonblob.com/api/jsonBlob/894398690379448320").responseJSON{ (response) in
               switch response.result{
               case .success:
                   do{
                       let result = try JSONDecoder().decode(Peoplelist.self, from: response.data!)
                       onSuccuss(result)
                   }catch{
                       print("fail decode : \(response.error!)")
                   }
               case let .failure(err):
                   print("fail request : \(err)")
               }
           }
       }
}

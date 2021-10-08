//
//  ViewController.swift
//  tableview
//
//  Created by ธนัท แสงเพิ่ม on 7/10/2564 BE.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var allpeople:Peoplelist = Peoplelist(results: [])
    
    var rowToGo = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PeopleTableViewCell
        let eachpeople = allpeople.results[indexPath.row]
        cell.peoplename.text = eachpeople.name
        cell.peepleImage.image = eachpeople.imageProfileUrl.load()
        cell.peepleImage.makeRounded()
        cell.peoplePosition.text = eachpeople.position
        cell.peopleTelephone.text = eachpeople.telOrgList[0]
        cell.peopleMobilephone.text = eachpeople.mobileList[0]
        cell.peopleEmail.text = eachpeople.emailGov
        cell.peopleNavdate.text = fixStrDate(dateStr: eachpeople.nav_date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allpeople.results.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.self[1])
        rowToGo = indexPath.self[1]
        self.performSegue(withIdentifier: "goToChar", sender: self)
    }
    
//    func fetch(){
//        guard let url = URL(string: "https://jsonblob.com/api/jsonBlob/894398690379448320") else{return}
//        let task = URLSession.shared.dataTask(with: url){data, res, err in
//            guard let data = data , err == nil else {return}
//            do{
//                let PP = try JSONDecoder().decode(Peoplelist.self, from: data)
//                DispatchQueue.main.async {
//                    self.allpeople = PP
//                    print(self.allpeople)
//                   print("--> \(strToDate(strDate: self.allpeople.results[0].nav_date)) << date")
//                    self.table.reloadData()
//                }
//            }catch{print(error)}
//        }
//        task.resume()
//    }
    
    func fetchAlamo(){
        AF.request("https://jsonblob.com/api/jsonBlob/894398690379448320").responseJSON{ (response) in
            switch response.result{
            case .success:
                do{
                    let result = try JSONDecoder().decode(Peoplelist.self, from: response.data!)
                    print(result.results[0])
                    self.allpeople = result
                    self.table.reloadData()
                }catch{
                    print("fail decode : \(response.error!)")
                }
            case let .failure(err):
                print("fail request : \(err)")
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToChar"{
            let destinationVC = segue.destination as! CharViewController
            destinationVC.imageValue = allpeople.results[rowToGo].imageProfileUrl
            destinationVC.emailValue = allpeople.results[rowToGo].emailGov
            destinationVC.engNameValue = allpeople.results[rowToGo].nameEng
            destinationVC.thaiNameValue = allpeople.results[rowToGo].name
            destinationVC.copValue = allpeople.results[rowToGo].orgNameWbs
            destinationVC.telValue = allpeople.results[rowToGo].telOrgList[0]
            destinationVC.inTelValue = allpeople.results[rowToGo].telOrgExt
            destinationVC.mTelValue = allpeople.results[rowToGo].mobileList[0]
            destinationVC.emailValue = allpeople.results[rowToGo].emailGov
        }
    }
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAlamo()
        table.delegate = self
        table.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    

}


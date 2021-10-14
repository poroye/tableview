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
        rowToGo = indexPath.row //indexPath.self[1]
        let nowPeople = allpeople.results[rowToGo]
//        self.performSegue(withIdentifier: "goToChar", sender: self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CharViewController") as! CharViewController
        vc.imageValue = nowPeople.imageProfileUrl
        vc.emailValue = nowPeople.emailGov
        vc.engNameValue = nowPeople.nameEng
        vc.thaiNameValue = nowPeople.name
        vc.copValue = nowPeople.orgNameWbs
        vc.telValue = nowPeople.telOrgList[0]
        vc.inTelValue = nowPeople.telOrgExt
        vc.mTelValue = nowPeople.mobileList[0]
        vc.emailValue = nowPeople.emailGov

        navigationController?.pushViewController(vc, animated: true)
        // have to have navigationController in storyboard
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

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Repository.fetchAlamo(onSuccuss: { result in
            self.allpeople = result
            self.table.reloadData()
        })
        table.delegate = self
        table.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    

}


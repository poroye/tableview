//
//  ViewController.swift
//  tableview
//
//  Created by ธนัท แสงเพิ่ม on 7/10/2564 BE.
//

import UIKit

var allpeople:peoplelist = peoplelist(results: [])

func fetch(){
    guard let url = URL(string: "https://jsonblob.com/api/jsonBlob/894398690379448320") else{return}
    let task = URLSession.shared.dataTask(with: url){
        data, res, err in
        guard let data = data , err == nil else {return}
        do{
            let PP = try JSONDecoder().decode(peoplelist.self, from: data)
            DispatchQueue.main.async {
                allpeople = PP
                print(allpeople)
                            }
        }catch{print(error)}
    }
    task.resume()
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! peopleTableViewCell
        let eachpeople = allpeople.results[indexPath.row]
        cell.peoplename.text = eachpeople.name
        cell.peepleImage.image = UIImage(named:"31357")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allpeople.results.count
    }

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        table.delegate = self
        table.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    

}


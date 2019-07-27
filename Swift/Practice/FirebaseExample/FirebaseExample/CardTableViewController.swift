//
//  CardTableViewController.swift
//  FirebaseExample
//
//  Created by Wi on 20/07/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import FirebaseDatabase


class CardTableViewController: UITableViewController {
    
    var ref: DatabaseReference! // firebase database defualt ref
    var cardDatas = [CardDataStruct]()
    var images =  [UIImage?]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        
        dataRequest()
    }
    
    // MARK: - data network
    
    func dataRequest(){
        ref.child("card_data").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let data = snapshot.value else {
                print("data nil")
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                self.cardDatas = try JSONDecoder().decode([CardDataStruct].self, from: jsonData)
                
                self.cardDatas.forEach({ card in
                    guard let url = URL(string: card.imageURL) else {return}
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                        // handle error
                        if let error = error {
                            print("Failed to load image wiht error", error.localizedDescription)
                        }
                        // image data
                        guard let imageData = data else {return}
                        
                        // set image using image data
                        let image = UIImage(data: imageData)
                        self.images.append(image)
                        print(self.images.count)
                        self.tableView.reloadData()
                        }.resume()
                })
            }
            catch{
                print(error.localizedDescription)
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cardDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell: UITableViewCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            reuseCell = cell
        }else{
            reuseCell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        reuseCell.textLabel?.text = cardDatas[indexPath.row].name
        reuseCell.detailTextLabel?.text = "\(cardDatas[indexPath.row].rank) 위"
        reuseCell.imageView?.image = images[indexPath.row]
        return reuseCell
    }
    
    

}

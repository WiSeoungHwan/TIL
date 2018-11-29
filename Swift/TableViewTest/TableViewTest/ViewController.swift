//
//  ViewController.swift
//  TableViewTest
//
//  Created by Wi on 28/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var source: [String] = [
        "sfsdflkjsdlkfjsdlkfjsdklfjdslkfjdslf",
        "sfsdflkjsdlkfjsdlkfjsdklfjdslkfjdslf",
        "sfsdflkjsdlkfjsdlklkfjslkfjslkfjsfjsdklfjdslkfjdslf",
        "sfsdflkjsdlkfjsdlkflkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjsjsdklfjdslkfjdslf",
        "sfsdflkjsdlkfjsdlkfjlkfjslkfjslkfjssdklfjdslkfjdslf",
        "sfsdflkjsdlkfjsdlkfjsdklfjdlkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjsslkfjdslf",
        "sfsdflkjsdlkfjsdlkfjsdklfjdslkfjdslf",
        "sfsdflkjsdlkfjsdlkfjsdklfjlkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjslkfjsdslkfjdslf",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "cell")
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.textLabel?.text = source[indexPath.row]
        cell.clipsToBounds = true
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }
}

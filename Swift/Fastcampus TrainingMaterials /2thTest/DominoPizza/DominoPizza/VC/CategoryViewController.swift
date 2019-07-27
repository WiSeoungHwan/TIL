//
//  ViewController.swift
//  DominoPizza
//
//  Created by Kira on 18/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    // MARK: - Properties
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    var categoryArr: [String] = DominoMenuData.category
    
    // MARK: - Methods
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: other func
    func configure(){
        vcSetting()
        tableViewSetting()
        autolayout()
    }
    func vcSetting(){
        self.title = "Domino's"
    }
    func tableViewSetting(){
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.separatorColor = .clear
        
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "imageCell")
    }


}
// MARK: - extention

// MARK: tableView extension

extension CategoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
        if indexPath.row == 0 {
            cell.cellImageView.contentMode = .scaleAspectFit
        }
        cell.cellImage = UIImage(named: categoryArr[indexPath.row])
        cell.cellType = categoryArr[indexPath.row]
        return cell
    }
    
}

extension CategoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return CGFloat(tableView.frame.height / 6 * 2)
        }
        return CGFloat(tableView.frame.height / 6)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row != 0 else {return}
        guard let tablecell = tableView.cellForRow(at: indexPath), let cell = tablecell as? ImageTableViewCell else {return}
        let pizzaVC = PizzaListViewController()
        switch cell.cellType! {
        case "사이드디시":
            pizzaVC.dataArr = DominoMenuData.sideDishArr
        case "슈퍼시드":
            pizzaVC.dataArr = DominoMenuData.superCeedArr
        case "음료":
            pizzaVC.dataArr = DominoMenuData.beverageArr
        case "클래식":
            pizzaVC.dataArr = DominoMenuData.classicArr
        case "프리미엄":
            pizzaVC.dataArr = DominoMenuData.primiumArr
        case "피클소스":
            pizzaVC.dataArr = DominoMenuData.prickleSauce
        default:
            break
        }
        
        self.navigationController?.pushViewController(pizzaVC, animated: true)
    }
}


// MARK: autolayout
extension CategoryViewController{
    func autolayout(){
        let guide = self.view.safeAreaLayoutGuide
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true

    }
}

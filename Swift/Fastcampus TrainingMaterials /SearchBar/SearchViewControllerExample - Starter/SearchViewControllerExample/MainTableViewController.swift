//
//  MainTableViewController.swift
//  SearchViewControllerExample
//
//  Created by Wi on 11/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var dataArr = menuData
    var filteredDataArr = [Product]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza Search"
        dataArr.forEach{
            filteredDataArr += $0.menu
        }
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = searchController
        self.searchController.obscuresBackgroundDuringPresentation = false // 검색하는 동안 기본내용이 가려져 있을지
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.searchBar.scopeButtonTitles = menuData.map{$0.category}
        self.searchController.searchBar.scopeButtonTitles?.insert("All", at: 0)

        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDataArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = filteredDataArr[indexPath.row].name
        cell.detailTextLabel?.text = String(filteredDataArr[indexPath.row].price)
        return cell
    }
    
    
    // MARK: - For Search method

    func filterContentForSearchText( _ searchText: String, scope: String = "All"){
        filteredDataArr = []
        dataArr.forEach{
            let doesCategoryMatch = ($0.category == scope) || (scope == "All")
            if searchBarIsEmpty(){
                filteredDataArr += $0.menu.filter{ _ in doesCategoryMatch}
            }else{
                filteredDataArr += $0.menu.filter{doesCategoryMatch && $0.name.contains(searchText)}
            }
        }
        
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

}

extension MainTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // searchBar 에서 글자를 눌렀을 때
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension MainTableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        // 스코프를 눌렀을때
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // cancel 버튼 눌렀을때
//        let searchBar = searchController.searchBar
        searchBar.selectedScopeButtonIndex = 0
    }
}



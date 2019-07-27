//
//  MainTableViewController.swift
//  CandiesSearchController
//
//  Created by Wi on 13/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Basic SearchController Setting
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        // Setup other SearchController Setting
        searchController.searchBar.placeholder = "Search Candy Name"
         // 검색할때 뒷 화면을 흐리게 표현할것인지
        searchController.obscuresBackgroundDuringPresentation = false
        // 검색창 밑에 스코프버튼 만들기
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        candies =  [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear"),
            Candy(category:"Other", name:"Candy Floss"),
            Candy(category:"Chocolate", name:"Chocolate Coin"),
            Candy(category:"Chocolate", name:"Chocolate Egg"),
            Candy(category:"Other", name:"Jelly Beans"),
            Candy(category:"Other", name:"Liquorice"),
            Candy(category:"Hard", name:"Toffee Apple")]
        
        filteredCandies = candies
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredCandies.count // * 바뀐 부분
        
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = filteredCandies[indexPath.row].name // * 바뀐 부분
        cell.detailTextLabel?.text = filteredCandies[indexPath.row].category // * 바뀐 부분
        return cell
    }
    
    // MARK: - For Search method
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All"){
//        // * 바뀐부분
//        if searchBarIsEmpty() { // * 바뀐부분
//            filteredCandies = candies // * 바뀐부분
//        }else{
//            filteredCandies = candies.filter{
//                $0.name.contains(searchText)
//            }
//        }
        
        filteredCandies = candies.filter{
            // 어떤 스코프에 맞는지 bool값을 하나 만듭니다.
            let doesCategoryMatch = (scope == "All") || ($0.category == scope)
            if searchBarIsEmpty() { // 검색창이 비었다면
                return doesCategoryMatch // 스코프에 맞는 데이터들을 모두 리턴합니다.
            } else {// 검색창이 비어있지 않으면
                // 선택된 스코프에 속해있고 검색된 텍스트를 가지고있는 데이터들을 리턴합니다.
                return doesCategoryMatch && $0.name.lowercased().contains(searchText.lowercased()) // 대소문자 구분하지 않기 위함
            }
        }
        tableView.reloadData()
        
    }
    func searchBarIsEmpty() -> Bool{
        // searchBar의 text의 유무를 반환하고 만약 nil 이라면 true 반환
        return searchController.searchBar.text?.isEmpty ?? true
    }

}


extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
//        print("검색중")
//        filterContentForSearchText(searchController.searchBar.text!)
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    
}

extension MainTableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        // 스코프가 선택될때
//        print("스코프가 선택되었음")
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        
    }
}

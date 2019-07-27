# SearchController 

* navigationItem에 들어갈수 있는 객체로 사용자가 검색을 이용할 시에 검색 이벤트를 받을 수 있다. 
* iOS 8 버전에서 추가되었고 이전엔 UISearchDisplayController 로 사용되었다.
* 기존과의 다른 점
	* UISearchResultsUpdating 추가 : 기존엔 UITableView를 이용해 결과를 나타냈었지만 현재는 collectionView 로 나타내는게 가능  

* 좋은 정리글: https://codershigh.github.io/WebSite/techblogs/tb_009_UISearchController/tb009_script.html
## SearchController 만들기

* searchViewCotroller 객체 인스턴스 하기 
* searchViewController.searchResultsUpdater = self (검색창의 내용이 변경될때 이벤트를 받기 위해서)
	* searchResultsUpdater: 사용자가 검색 창에 입력 한 정보를 기반으로 검색 결과를 업데이트 할 수있는 메서드 집합입니다.( 애플문서)
	* 필수 구현 함수: updateSearchResults(for: UISearchController) 
		* 검색창이 firstResponder되거나 검색창의 내용이 변경되었을때 불리는 함수
```swift
extension MasterViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    filterContentForSearchText(searchController.searchBar.text!, scope: scope)
  }
}
```
* searchViewController.searchBar.delegate = self  
	* searchBarDelegate는 searchBar의 이벤트를 전달하는 객체입니다.
	* 예제에서는 scope를 사용하기 위해 사용됩니다.

```swift
extension MasterViewController: UISearchBarDelegate {
  // MARK: - UISearchBar Delegate
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
  }
}
```

## SearchController 추가 설정

viewDidLoad()에서
 ```swift 
  // placeholder 설정
    searchController.searchBar.placeholder = "Search Candies"
    // navigationItem 에 넣기
    navigationItem.searchController = searchController
    // 검색할때 뒷 화면을 흐리게 표현할것인지
    searchController.obscuresBackgroundDuringPresentation = false
    // 검색창 밑에 스코프버튼 만들기
    searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
 ```
 
 
 
 ## 실습할것들
 
 
 * 사탕 데이터를 테이블뷰에 띄워보고 검색창에서 검색해봅니다.
 * 스코프에서 선택된 데이터들만 검색창에 띄워보고 스코프를 선택한 상태에서 검색해봅니다.
 
 ## 실습
 
 ### 사탕데이터 만들기
 
 * 테이블뷰에 데이터를 표현하기 위해서 데이터 배열이 필요합니다. 
 * candies 라는 배열을 하나 만들어줍니다.
 	* ```swift var candies = [Candy]() ```
 		
 	* viewDidLoad() 에서 아래의 데이터로 candies 배열을 채워줍니다.
 		* ```swift candies =  [
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
            ```
### 테이블 뷰에 띄워주기

* 테이블뷰에 candies 배열로 데이터를 표현해줍니다.
 ```swift 
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return candies.count
        
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = candies[indexPath.row].name
        cell.detailTextLabel?.text = candies[indexPath.row].category
        return cell
    }
 ```
 
 * 실행해서 테이블 뷰에 데이터가 잘 나왔는지 검색창은 잘 동작하는지 확인해봅니다.


 ### 데이터 검색 구현하기 
 	
   * 데이터 검색을 구현하기 전에 데이터 검색 기능을 할 함수를 하나 만들어 줍니다.
   ```swift 
   func filterContentForSearchText(_ searchText: String, scope: String = "All"){
    }
   ```
* 검색되는 텍스트를 받아서 데이터에서 찾아 테이블뷰에 업데이트 시켜줄 함수입니다.
	
    * 검색된 데이터들을 받을 배열을 클래스 변수로 하나 만듭니다.

	```swift 
    var filteredCandies = [Candy]()
	```
    
	* filterContentForSearchText 에서 다음의 코드를 추가합니다.
	
    
	```swift
     func filterContentForSearchText(_ searchText: String, scope: String = "All"){
        filteredCandies = candies.filter{
            $0.name.contains(searchText)
        }
        tableView.reloadData()
        
    }
    ```
   * 테이블뷰에서 띄워질 데이터를 candies -> filteredCandies 로 바꿔줍니다.
   * updateSearchResults 에서 위에서 만들어준 함수를 호출해줍니다.
  ```swift
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
    ```

```swift
func updateSearchResults(for searchController: UISearchController) {
        print("검색중")
        filterContentForSearchText(searchController.searchBar.text!)
    }
```


* 실행해서 검색창이 잘 동작하는지 확인해봅니다.

### 검색 상황 체크하기 

* 여기까지 해봤을때 문제점 2가지 정도가 있습니다.

	1. 검색하기전 데이터가 나타나지 않는다.
	2. 검색을 하다가 내용을 지웠을때 내용이 나타나지 않는다.

* 첫번째 문제 해결하기 
	* 현재 코드에서 테이블뷰가 filteredCandies의 데이터를 보여주기 때문에 초기에 filteredCandies 데이터를 채워줄 필요가있습니다.
	* viewDidLoad() 에서 아래 코드를 추가 해줍니다.
	```swift
    filteredCandies = candies
    ```

* 두번째 문제 해결하기 
	* SearchBar가 검색중인지 아닌지 검사해서 검색중이 아닐때는 기존 모든 데이터를 추가해줄 필요가 있습니다.
	* 아래와 같은 함수를 만듭니다.
	```swift
    func searchBarIsEmpty() -> Bool{
        // searchBar의 text의 유무를 반환하고 만약 nil 이라면 true 반환
        return searchController.searchBar.text?.isEmpty ?? true
    }
    ```
    * filterContentForSearchText 에 아래 코드를 추가합니다.
    ```swift
    func filterContentForSearchText(_ searchText: String, scope: String = "All"){
        // * 바뀐부분
        if searchBarIsEmpty() { // * 바뀐부분
            filteredCandies = candies // * 바뀐부분
        }else{
            filteredCandies = candies.filter{
                $0.name.contains(searchText)
            }
        }
        tableView.reloadData()
        
    }
    ```
    * SearchBar의 텍스트의 유무를 검사해서 만약 없다면 검색중이 아닌 상황으로 받아들이고 filteredCandies 에 모든 데이터를 넣어줍니다.


### 스코프 

* 검색창의 아래쪽을 보면 카테고리 별로 선택할 수 있는 세그먼트가 하나 있습니다. 이것을 스코프라고 부릅니다.
* SearchController 추가설정에서 viewDidLoad() 쪽에서 스코프의 타이틀에 배열을 추가시켜주었습니다.
	```swift
    // 검색창 밑에 스코프버튼 만들기
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
    ```
* 이곳에 값을 넣으면 스코프가 만들어지고 값을 넣지 않으면 스코프를 만들지 않습니다.

### 스코프기능과 검색기능 합치기

* 스코프버튼이 눌렸을때와 검색했을때 어떤 스코프가 선택되었는지 알기 위해서 UISearchBarDelegate와 UISearchResultsUpdating에서 아래 코드를 추가해줍니다.

```swift
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
```


* 이제 filterContentForSearchText 함수가 현재 선택된 scope를 알 수있습니다.
* filterContentForSearchText 함수를 아래 코드로 바꿔줍니다.

```swift
func filterContentForSearchText(_ searchText: String, scope: String = "All"){
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

```

* 이제 실행해서 잘 동작하는지 살펴봅니다.
 
 
 
 
 ## 문제 
 
 * 도미노 데이터를 가져와서 검색기능 구현하기 
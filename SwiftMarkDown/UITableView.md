#  UITableView

* UITableView는 UIScrollView를 상속 받고 있는 뷰이다.
* 수직스크롤만 가능하다
* 테이블뷰는 항목을 가지고 있으며 개별 항목을 구성하는 것을 cell 이라고 한다. (UITableViewCell)
* 테이블뷰의 셀에는 액서서리 뷰 들이 있는데 셀을 삭제하거나 추가하는 메뉴를 설정할 수 있다. 
* 테이블 뷰는  0개 이상의 섹션으로 구성되며 각 섹션에는 자체 행이 있다. 
* 섹션은 테이블 뷰 내의 인덱스로 식별된다.
* 각 셀에 identifier를 설정하여 셀을 구별한다. 

## UITableView.Style

* UITableView.Style.plain vs UITableView.Style.grouped
    * 테이블 뷰는 위의 두가지 스타일을 가질 수 있다. 
    * UITableView  를 인스턴스 할때 테이블 스타일을 지정할 수있다. 
    * plain 은 셀들이 쭉 나열되 있는형식 
    * grouped 는 섹션마다 간격이 넓게 되어 있다. 예) iphone setting

## UITableViewDataSource

* UITableView를 구현 할 때에는 필수적으로 UITableViewDataSource 를 구현 해야한다. 
* UITableViewDataSource는 UITableView가 테이블을 생성하고 테이블 행을 삽입, 삭제 또는 재정렬 할 때 데이터 모델을 관리해야한다는 정보를 제공한다. 
* 쉽게 말해서 cell의 개수 section의 개수 같은 것들을 몇개 씩 할 것인지 데이터에 맞추어서 설정을 할 수있는 부분이다.
* 행에서 가로로 스와이프 하여 삭제 기능을 사용하려면 ` tableView (_ : commit : forRowAt :) ` 을 구현해야 한다. 
* 필수 구현 함수 
```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return 8 // section 당 셀의 개수
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // 스토리보드에서 등록해 두었다면 등록해둔 cell 의 identifier 등록하지 않았다면 코드로 따로 구현 
cell.textLabel?.text = "Hello World"
return cell
}
```


## UITableViewDelegate
 
 * UITableViewDataSource와 달리 필수로 구현해야하는 요소는 아니다 
 * TableView에서 들어온 이벤트들을 관리한다 
 * 선택 사항을 관리하고, 섹션 머리글과 바닥 글을 구성하고, 셀을 삭제하고 순서를 변경하는 등의 작업을 수행 할 수 있다.
 
 
 * Delegate 주요 함수들 
 ```swift
 extension ViewController: UITableViewDelegate{
 //각 셀의 height값
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 return 100
 }
 //행의 들여쓰기 수준
 func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
 return 1
 }
 // 특정행에 대해 셀을 그리려고 할때 호출되는 함수
 func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
 
 }
 // editAction버튼을 추가하는 함수
 func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
 //타입은 세가지가 있고 각각 눌렸을때 반응을 클로져로 처리 가능하다
 let defaultRowAction = UITableViewRowAction(style: .default, title: "default") { (self, indexPath) in
 print("default Tap")
 }
 //커스터마이징도 가능
 defaultRowAction.backgroundColor = .green
 let normalRowAction = UITableViewRowAction(style: .normal, title: "normal") { (self, indexPath) in
 print("normal Tap")
 }
 let destructiveRowAction = UITableViewRowAction(style: .destructive, title: "destructive") { (self, indexPath) in
 print("destructive Tap")
 }
 //버튼들을 배열로 반환
 return [defaultRowAction,normalRowAction,destructiveRowAction]
 }
 
 //왼쪽으로 스와이프 했을때 작동하는 함수 
 func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
 let contextualAction = UIContextualAction(style: .destructive, title: "sdf") { (action, view, completion) in
 action.title = "🌈"
 completion(false) // 끝까지 스와이프 했을때 삭제되는 모션 활성화 여부
 }
 let leadingSwipeAction = UISwipeActionsConfiguration(actions: [contextualAction])
 return leadingSwipeAction
 }
 }
```


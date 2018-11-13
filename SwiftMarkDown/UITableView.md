#  UITableView

* UITableView는 UIScrollView를 상속 받고 있는 뷰이다.
* 수직스크롤만 가능하다
* 테이블뷰는 항목을 가지고 있으며 개별 항목을 구성하는 것을 cell 이라고 한다. (UITableViewCell)
* 테이블뷰의 셀에는 액서서리 뷰 들이 있는데 셀을 삭제하거나 추가하는 메뉴를 설정할 수 있다. 
* 테이블 뷰는  0개 이상의 섹션으로 구성되며 각 섹션에는 자체 행이 있다. 
* 섹션은 테이블 뷰 내의 인덱스로 식별된다.

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


## UITableViewDelegate
 


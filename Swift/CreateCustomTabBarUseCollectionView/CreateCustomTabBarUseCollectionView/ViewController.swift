import UIKit

class ViewController: UIViewController{
    // 커스텀 탭바를 표현하는 컬렉션뷰
    var collectionView = { () -> UICollectionView in
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal // 스크롤 방향은 가로
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 500, height: 60), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false // 자동 정렬 끄기
        return collectionView
    }()
    // 커스텀 바 밑에 선택된 창을 나타내는 뷰
    var indicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    //컬렉션 뷰 안에 들어갈 tabbar 
    var customTabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let tabBarTitles = ["첫번째", "두번째", "세번째", "네번째"]
    let imageNames = ["home","search","heart","bookmark"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        setupCollectionView()
        setupCustomTabBar()
        print("2")
        

    }
    func setupCollectionView(){
        //컬렉션 뷰의 델리게이트와 데이터소스 연결
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        //코드로 해주었기 때문에 셀을 등록합니다
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        //스크롤되지 않게 막음
        collectionView.isScrollEnabled = false
    }
    var indicatorViewLeadingConstraint:NSLayoutConstraint! // ---- *
    func setupCustomTabBar(){
        self.view.addSubview(customTabBar)
        customTabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        customTabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        customTabBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true // ---- *
        customTabBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        customTabBar.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: customTabBar.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: customTabBar.topAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        customTabBar.addSubview(indicatorView)
        indicatorView.widthAnchor.constraint(equalToConstant: self.view.frame.width/4).isActive = true // ---- *
        indicatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor)
        indicatorViewLeadingConstraint.isActive = true
        indicatorView.bottomAnchor.constraint(equalTo: customTabBar.bottomAnchor).isActive = true
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        // 처음 로드될때 뷰가 0번쨰 이도록
        if indexPath.row == 0 {
            cell.label.textColor = .black
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        }
//        cell.backgroundView = UIImageView(image: UIImage(named: "home"))
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])
//        cell.label.text = self.imageNames[indexPath.row]
        
        print("cellError")
        return cell
    }
    
    
    
}
extension ViewController: UICollectionViewDelegate{
    //탭바가 선택될때 밑에 바가 따라다니게 구현
    //선택되었을때 불리는 함수
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell else {return}
        cell.imageView.alpha = 1
//        cell.label.textColor = .black
//        cell.backgroundView = UIImageView(image: UIImage(named: "home"))
        //탭바의 개수가 4개니까 4로 나누어서 선택된 탭바의 로우값을 곱해서 바의 위치를 이동시킨다.
        indicatorViewLeadingConstraint.constant = (self.view.frame.width / 4) * CGFloat((indexPath.row))
        //애니메이션 효과 주기
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.customTabBar.layoutIfNeeded()
        }, completion: nil)
    }
    //선택이 취소 되었을때 호출되는 함수
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell else {return}
//        cell.label.textColor = .lightGray
        cell.imageView.alpha = 0.5
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 4 , height: 55)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    } // ---- 1
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    } // ---- 2

}

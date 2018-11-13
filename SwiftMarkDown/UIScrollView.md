#  UIScrollView 

* 제한된 크기 보다 더 큰 컨텐츠를 표현하기 위한 뷰 
* 지도 , 사진 등등 

## Property & Methods

* var contentSize: CGSize  컨텐츠 뷰의 사이즈(이미지의 사이즈 )
* var contentOffset: CGPoint  스크롤 뷰 안에서  컨텐츠 뷰의 위치 
* var contentInset: UIEdgeInsets 스크롤 뷰에서 컨텐츠가 얼마만큼 안으로 들어갈 것 인지.
* func setContentOffset(CGPoint, animated: Bool): offset을 함수의 매개변수로 들어온 위치로 변경시키는데 애니매이션 처럼 부드럽게 갈 것인지 아닌지 정할 수 있다. 애니매이션 효과를 보려면 viewDidAppear에서 실행하자 !


## How Use UIScrollView

* 스크롤 뷰에 표현할 컨텐츠 올리기 
* 스크롤 뷰 델리게이트 연결 
* `viewForZooming(in scrollView: UIScrollView) -> UIView?`  구현 해서 컨텐츠뷰 구현 
* `maximumZoomScale` , `minimumZoomScale` 설정하기 
* ZoomScale 설정 하기 


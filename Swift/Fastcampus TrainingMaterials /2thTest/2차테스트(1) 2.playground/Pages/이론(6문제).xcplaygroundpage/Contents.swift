//: [Previous](@previous)
import Foundation

/***************************************************
 TableView 아래의 두 메서드가 각각
 1) 언제 사용되고  2) 차이점은 무엇인지에 대하여 작성
 - dequeueReusableCell(withIdentifier: <#T##String#>)
 - dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
 ***************************************************/

//- dequeueReusableCell(withIdentifier: <#T##String#>)

// 1) 셀이 있는지 확인할때? // 2) 옵셔널 타입

//- dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)

// 1) 셀을 얻고 해당 indexpath에 추가하고 싶을때 2) 옵셔널 아님

/***************************************************
 safeAreaInsets  /  safeAreaLayoutGuide 의 차이점에 대해 작성
 ***************************************************/

// safeAreaInsets: frame 기반
// safeAreaLayoutGudie: AutoLayout 기반


/***************************************************
 UIView에서 아래 두 메서드의 차이점에 대해 작성
 - override init(frame: CGRect)
 - required init?(coder aDecoder: NSCoder)
 ***************************************************/

//- override init(frame: CGRect)
//코드로 짰을때 호출
//- required init?(coder aDecoder: NSCoder)
//스토리보드파일을 불러올때 호출




/***************************************************
 Strong Reference Cycle 에 대해 설명하고 예시 코드 작성
 ***************************************************/

//Strong Reference Cycle
//
//swift에서  heap 영역의 사용되지 않는 변수를 제거하기 위해 참조되는 변수 카운팅 방식을 사용하는데
//heap영역에서 heap영역으로 쌍방으로 참조될때 참조 카운팅이 0이 되지 않아 계속해서 메모리영역을 차지하고있는 상황을 말함

class TestClass{
    var testClass: TestClass? = nil
    init(){
        print("init")
    }
    deinit {
        print("deinit")
    }
}

var testClass1: TestClass? = TestClass()
var testClass2: TestClass? = TestClass()

testClass1?.testClass = testClass2
testClass2?.testClass = testClass1

testClass1 = nil
testClass2 = nil

testClass1?.testClass = TestClass()

/***************************************************
 Strong, Unowned, Weak 의 차이점에 대해 설명하고 예시 코드 작성
 ***************************************************/
//Strong
//참조 카운팅을 1증가 시킨다

class StrongTest{
    var aBlock: (()->())? = nil
    let aConstant = 5
    
    init(){
        print("init")
        aBlock = {
            print(self.aConstant)
        }
    }
    deinit {
        print("deinit")
    }
}

var strongTest: StrongTest? = StrongTest()
strongTest = nil
// deinit 호출되지 않음. aBlock클로저 안에서 self로 자기자신을 참조하고 있기때문 *closure는 heap영역에 저장됨

//Unowned
//반드시 값이 있고 참조 카운팅을 증가시키지 않는다.
//반드시 값이 있다고 판별하기때문에 해당 변수가 메모리에서 해제되고 접근을 하면 런타임 에러가 난다

class UnownedTest{
    var aBlock: (()->())? = nil
    let num = 5
    
    init(){
        print("init")
        aBlock = { [unowned self] in
            print(self.num)
        }
    }
    deinit {
        print("deinit")
    }
}

var unownedTest: UnownedTest? = UnownedTest()
unownedTest = nil

//deinit 호출됨

//Weak
//옵셔널 타입에 적용 가능하고 카운팅을 증가시키지 않는다.
//값이 있다면 옵셔널 타입으로 접근이 가능하고 없다면 nil을 반환한다.

class WeakTest{
    var aBlock: (()->())? = nil
    let num = 5
    
    init(){
        print("init")
        aBlock = { [weak self] in
            print(self?.num)
        }
    }
    deinit {
        print("deinit")
    }
}

var weakTest: WeakTest? = WeakTest()
weakTest = nil
//deinit 호출됨


/***************************************************
 업캐스팅과 다운캐스팅에 대하여 설명하고,
 업캐스팅과 다운캐스팅을 시도할 때 사용하는 키워드에 대해 각각 설명
 ***************************************************/

//업캐스팅
//
//하위클래스 타입을 상위 클래스 타입으로 캐스팅 할때
// as 오류가 발생한 가능성이 없다.

// 다운캐스팅

// 상위 클래스 타입을 하위클래스로 캐스팅할때
// as! 강제 캐스팅 오류가 발생할 가능성이 있다. 반드시 성공할때에만 사용
// as? 오류가 발생하면 nil을 반환하므로 오류에 대한 처리를 할수 있다. 

//: [Next](@next)

//: Playground - noun: a place where people can play

import UIKit

//매개변수 기본값

func greeting(friend: String, me: String = "Seong Hwan"){
    print("Hello \(friend), I'm \(me)")
}

greeting(friend: "Jo")

///설명 매개변수에 기본적으로 기본값을 지정할 수도 있고 나중에 다시 지정할 수도 있다.
///    기본값을 가지는 매개변수는 생략이 가능하다.

//전달인자 레이블

func greeting(to friend: String, from me: String){
    print("Hello \(friend), I'm \(me)")
}

greeting(to: "Kim",from: "SeongHwan")// 함수를 호출할떄는 전달인자 레이블을 사용한다.
///설명 매개변수에 전달인자 레이블을 붙임으로써 같은 이름의 함수이지만 다른 함수로 인식이 되어 오류가 나지 않는다.
///    greeting의 전달인자 레이블인 to와 from까지 함수 이름으로 취급이 되기 때문에 다른함수로 인식된다.
///    동일한 함수를 전달인자레이블만 변경하여 중복으로 생성할 수 있다.
///    함수를 호출할떄 함수를 쓰는 사람 입장에서 변수의 역할을 더 명확하게 표현하고자 할때 사용한다.

//가변매개변수

func sayHelloToFried(from me: String = "SeongHwan", to friends: String...){///...과 타입간에 띄어쓰기 하면 안됨!
    print("Hello \(friends), I'm \(me)")
}
//함수 설명 전달인자 레이블을 사용했고 매개변수 기본값을 하나 정해주었다. 그리고 반환값이 없으므로 Void를 생략해주었고 friends를 가변매개변수로 설정해 값을 하나이상 들어올수있게 하엿다.
sayHelloToFried( to: "risa", "jisu","jenny","roje")

///설명   가변매개변수는 매개변수가 전달받을 값의 개수를 알수없을때 사용한다.
///      가변매개변수 역시 기본값이 있는 매개변수와 마찬가지로 매개변수중에 뒤에 위치한다.
///      가변매개변수는 함수당 하나만 가질수 있다.
///      가변매개변수, 기본값이 있는 매개변수, 전달인자레이블 , 반환 값이 없는 함수 모두 섞어서 사용가능하다.

//데이터 타입으로써 함수

///변수의 타입으로 함수 사용하기
var someFunction: (String,String) -> Void = greeting(to:from:)//기본값을 정해주었는데 오류가 난다.
someFunction("risa","jiso")//타입이 다른 함수는 할당할 수 없다.

///함수의 타입으로 함수를 사용하기

func runAnother(functionName: (String,String) ->Void){//매개변수로 되는 함수의 이름을 변수이름을 짓는 것처럼 지을 수 있다.
    functionName("jenny","risa")
}

runAnother(functionName: someFunction)// 변수로 랩핑한 함수를 매개변수로 넣어줄 수 있다.

runAnother(functionName: greeting(friend:me:))// 함수를 넣어준것


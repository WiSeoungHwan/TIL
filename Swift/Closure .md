#  Closure (람다식)



1. swift의 모든 함수의 기본은 Closure이다. 
2. 이름이 있는 closure는 func이라고 부른다. 
3. 다른 언어에서는 람다식으로 표현하기도 한다. 

---

## Basic Closure

* Swift는 함수를 변수에 넣을 수가 있다. 
* Closure 역시 모든 함수의 기본이기 때문에 변수에 할당 할 수 있다. 

```swift
//Closure의 기본 활용법 
let basicClosure = {
    print("basicClosure")
}

basicClosure() // "basicClosure"
// Closure에 입력값도 없고 반환값도 없다.

```


* 입력값을 정해주고 리턴타입을  정해줄 수있다. 
* 이름대신에 중괄호 `{}` 를 앞으로 당기고 매개 변수 및 return 타입과 함수 본문의 내용을 구분 짓기위해서 `in` 이라는 키워드를 사용 한다.

```swift
//입력, 리턴값을 정해준 클로져

let basicClosure = {(str: String) -> Int in // in 을 사용해서 본문과 타입을 구분했다 
return str.count}
```

---

## Inline Closure

* 함수안에 매개변수로 들어가는 형태이다. 
* 함수를 입력받고 함수를 반환하는 것도 가능하기 때문에 다양한 활용이 가능하다.

```swift
// 매개변수로 아래 타입의 함수나 closure를 받는다
func inlineClosure(closure: () -> Void ){
closure()
}
// 아래는 함수를 넣지 않고 클로져로 바로 구현부를 써준 경우 이다. 입력값이 없고 반환값이 없는 타입을 넣어주었다. 
inlineClosure(closure: {
print("Inline Closure")
})


```

---

## Trailing Closure

* 매개 변수 타입이 함수 인 함수 중에 매개변수가 1개 이거나 여러개중 __마지막에 한해서__ 이름을 생략하고 쓸 수 있다. 

```swift
// 마지막에 오는 매개변수(함수)의 이름을 생략 한 클로저

inlineClosure(closure: {
print("Inline Closure")
})

inlineClosure {// 위의 매개변수 이름을 생략하고 () 를 생략했다. 
print("Trailing Closure")
}
// 인자를 2개 받는 함수를 선언 

func closureParamFunction2(closure1: () -> Void, closure2: () -> Void) {
closure1()
closure2()
}

// 생략하지 않을때 
closureParamFunction2(closure1: {
print("inline")// 중간에 있는 클로져는 이름을 명시 해야함
}, closure2: {// 마지막에 있는 클로져는 이름을 생략 가능
print("inline")
})

//뒤에 이름을 생략했을 때 
closureParamFunction2(closure1: {
print("inline")
}) {// 생략한 것
print("trailing")
}

```

---

## Syntax Optimization

* 기존에 있던 closure를 간단하게 줄일 수 있다. 
* `$` 는 매개 변수를 의미( `$0` ,`$1` 등등 )

```swift

// closure 생략해보기


//함수 생성
func closureSyntaxOptimizationTest(closure: (String) -> Int){
print(closure("SyntaxOptimization"))
}

// 함수에 클로저 할당
closureSyntaxOptimizationTest(closure: {(str: String) -> Int in
return str.count })

//타입 추론으로 반환 값 생략가능
closureSyntaxOptimizationTest(closure: {(str: String) in
return str.count })

//입력값도 생략가능
closureSyntaxOptimizationTest(closure: {(str) in
return str.count })

//변수 명을 $로 생략 가능 하다
//매개 변수와 타입이 없어졌기 때문에 in도 생략 가능하다
closureSyntaxOptimizationTest(closure: {
return $0.count })

//소괄호를 땡겨줄 수 있다.
closureSyntaxOptimizationTest(closure: ){
return $0.count
}

// 마지막 파라미터나 파라미터가 하나밖에 없을때 생략 가능하다
// return 할 것도 한 구문밖에 없을때에는 return 명령도 생략가능하다.
closureSyntaxOptimizationTest(){ $0.count }

closureSyntaxOptimizationTest{ $0.count } //최종 생략모습


```



---


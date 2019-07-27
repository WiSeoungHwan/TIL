# iOS App Life Cycle

## iOS에서는 main Function을 쓰지 않을까?

C언어 기반의 함수들은  main이라는 함수가 앱의 시작이 됩니다.
iOS의 앱 또한 Objective-C 기반으로 돌아가기 때문에 main함수로 시작을 합니다. 하지만 iOS 핵심 라이브러리인  UIKit framework가 main 함수를 관리하기때문에 직접 개발자들이 main 함수에 코드를 작성하지 않습니다. 

## main Function에 관여하는 방법

UIKit framework는  main 함수를 다루는 과정에서 UIApplicationMain 함수를 실행 합니다. 이 함수를 통해 UIApplication 객체가 생성이 되는데 이 객체를 통해서 앱의 실행에 대해 부분적으로 관여할 수 있습니다. 

## UIApplication

이 UIApplication 객체는 싱글턴 형태로 UIApplication.shared 형태로 앱 전역에서 접근이 가능하게 만들어졌습니다.  
UIApplication 의 대표적 역할은 유저의 이벤트에 반응하여 앱의 초기설정을 하는 것 입니다. 예를 들면 앱이 Background에 진입한 상태에서 추가적인 작업을 할 수 있도록 만들어주거나, 푸시알람을 받았을 때 어떤 방식으로 이를 처리할지 등에 대한 것을 다룹니다. 

## Main Run Loop

UIApplication 객체는 앱이 실행될때, Main Run Loop를 실행합니다. Main Run Loop 라는 것은 유저가 이벤트를 일으키는 이벤트 들을 처리하는 프로세스입니다.UIApplication은 Main Run Loop를 View와 관련된 이벤트나 View의 업데이트에 활용합니다. 
* Main Run Loop는  View와 관련되어 있기 때문에 main 쓰레드에서 실행됩니다.

// 사진 

유저가 일으키는 이벤트의 처리 과정을 다음과 같은 순서로 정리할 수 있습니다. 

1. 유저가 이벤트를 일으킨다.(터치, 줌인 등)
2. 시스템을 통해 이벤트가 생성된다. 
3. UIKit 프레임워크를 통해 생성된 port로 해당 이벤트가 앱으로 전달된다. 
4. 이벤트는 앱 내부적으로 Queue의 형태로 정리되고, Main Run Loop에 하나씩 매핑된다. 
5. UIApplication 객체는 이때 가장 먼저 이벤트를 받는 객체로 어떤 것이 실행되야 하는지 결정한다.


## 앱의 상태 변화 

애플에서 정의하는 앱의 상태는 크게 5가지로 구분됩니다. 

// 사진 

* Not Running: 아무것도 실행하지 않은 상태
* InActive: 앱이 Foreground 상태로 돌아가지만, 이벤트는 받지 않는 상태, 앱의 상태 전환과정에서 잠깐 머무는 단계
* Active: 일반적으로 앱이 돌아가는 상태
* Background: 앱이  Suspended(유예 상태)로 진입하기전 거치는 상태 
* Suspended: 앱이 Background 상태에 있지만, 아무 코드도 실행하지 않는 상태, 시스템이 임의로  Background상태의 앱을 Suspended 상태로 전환

## AppDelegate

AppDelegate 는 앱의 각각 상태에 접근을 할 수 있도록 설계되었습니다. iOS 앱 프로젝트를 생성할때에 자동적으로 AppDelegate.swift 파일이 생기며 그 안에는 AppDelegate라는 클래스와 앱의 상태에 대응 할 수 있는 함수들이 들어있습니다. 

AppDelegate객체는 UIResponder, UIApplicationDelegate 를 상속 및 참조하고 있습니다.
 * UIResponder 는 앱에서 발생하는 이벤트들을 담고 있는 추상형 인터페이스 객체로 View와 사용자의 이벤트간의 연결을 관리하는 역할을 합니다. 


// appDelegate code


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    
* application:willFinishLanunchingWithOptions: 앱 실행시 가장 먼저 실행되는 함수
* application:didFinishLaunchingWithOptions: 앱이 사용자에게 표시되기 전 최종 초기화를 수행 할 수 있는 함수
* applicationDidBecomeActive: 앱이 포어 그라운드 앱이 되기전 실행 함수
* applicationWillResignActive: 앱이 포어그라운드에서 벗어나고 있을때 호출되는 함수, 이 함수를 사용하여 앱을 정지상태로 만들 수 있다. 
* applicationDidEnterBackground: 앱이 백그라운드에서 실행중일때 실행 함수. 언제든지 앱이 일시 중지될 수 있다.
* applicationWillEnterForeground: 앱이 백그라운드에서 벗어나 포어그라운드로 돌아왔을때 실행 함수. 앱은 아직 활 성화 되지 않음 
* applicationWillTerminate: 앱이 종료중일때 실행함수(일시정지 아님)



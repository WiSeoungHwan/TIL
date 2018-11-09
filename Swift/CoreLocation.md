#  CoreLocation


## core Location Framework

### 기기의 지리적 위치와 방향을 얻기 위한 프레임워크 
* 기기의 지리적 위치, 고도, 방향 또는  iBeacon 주변의 상대적 위치를 결정하는 서비스를 제공 
* Wi-Fi, GPS, Bluetooth, Magnetometer(자력계), Barometer(기압계), Cellular Hardware 등
* 위치 정보를 얻기 위해 반드시 유저로 부터 권한을 얻어야함 
* CLLocationManager 를 이용해 대부분의 서비스를 시작하고 delegate를 통해 응답을 수신 

## when in use authorization
앱이  foreground 에서 동작 중일때만 위치서비스 사용 
앱을 자동으로 재실행 하는 서비스는 사용불가 
굳이 Always를 써야하는 경우가 아니면 이 방식을 권장 

Always authorization
Foreground 나 Background 모두에서 필요할 때 위치 서비스 사용 
앱이 실행 중이지 않을때 위치 기반 이벤트가 발생하면 시스템이 앱을 실행 하고 이벤트를 전달 

CLLocationManager.requestWhenInuseAuthrization()
CLLocationManager.requsetAlwaysAuthorization()


## 위치서비스를 사용할 수 없는 상황 
 
 * 사용자가 위치 서비스 기능을 끔 
 * 사용자가 접근을 거부 
 * 기기가 비행기 모드로 설정되어 있을때 
 * 백그라운드 갱신 기능을 사용할 수 없고 필요한 기능을 우선 순위가 높은 다른 서비스가 이미 사용중일때 
 
 
 ## Getting the User's Location Data
 
 * Standard location service (When-in-use or Always authorization)
사용자위치를 실시간으로 파악 하기 위한 범용 솔루션
다른 서비스에 비해 더 많은 전력을 쓰지만 가장 정확하고 즉각적인 정보를 제공 

* Significant - change location service(Always authorization)

전력 소모를 줄이기 위한 것으로 업데이트가 자주 필요하지 않고 GPS 정밀도가 낮아도 되는 경우 사용 사용자 위치를 대폭 변경한 경우에만 업데이트를 제공
사용자가 걷고 있을 때 주변의 관심 장소(POI) 에 대한 추천 정보를 제안해주는 등의 서비스를 제공 가능


* Visits location service (Always authorization)

사용자 위치를 실시간으로 파악하기 위한 범용 솔루션
다른 서비스에 비해 더 많은 전력을 쓰지만 가장 정확하고 즉각적인 정보를 제공
전력 소모를 줄이기 위한 것으로 업데이트가 자주 필요하지 않고 GPS 정밀도가 낮아도 되는 경우 사용 사용자 위치를 대폭 변경한 경우에만 업데이트를 제공
사용자가 걷고 있을 때 주변의 관심 장소(POI) 에 대한 추천 정보를 제안해주는 등의 서비스를 제공 가능
가장 효율적으로 전력을 사용하지만 다른 서비스에 비해 업데이트 횟수가 적은 방법
유저가 한 장소에 머물러 시간을 보내다가 이동할 때 업데이트 알림 발생 (위치 및 시간 정보) 사용자의 행동 패턴을 파악하고 그 지식을 앱의 다른 부분에 적용하기 위한 서비스로 활용

```swift
// 업데이트를 반영하는 시기를 조정하는 함수 
allowDeferredLocationUpdates(untilTraveled:timeout)
```


## DesiredAccuracy 

* 위치 정보의 정밀도 값으로 반드시 보장되지는 않지만 가능한 한 설정에 가까운 정보를 취합
* 정밀도가 높을 수록 더 많은 전력 소비와 연산 시간이 필요하므로 높은 것이 꼭 좋은 것은 아니다 


## CLLocation

* 시스템으로 부터 전달되는 위도 경도 고도및 코스정보등을 답고 있는객체 
* 일반적으로 직접 생성하지 않으나 커스텀 위치 정보를 캐시하고 싶거나 두 지점 사이의 거리를 구하느 경우에는 생성할 수도 있다.

## CLLocationCoordinate2D (위도 경도)

* WGS 84 참조 프레임 을 사용하여 지정된 위도, 경도에 대한 위치 정보 

## Region Monitoring

사용자가 정의한 지역을 시스템이 모니터링하여 경계를 넘나들 때 필요에 따라 앱 활성화/이벤트 처리 
추상클래스인 CLRegion 을 상속받은 CLCircularRegion 클래스를 사용하며 특정 중심점을   기준으로 원형의 영역을 모니터링
코어 로케이션이 하나의 앱이 동시에 20개 이상의 지역을 모니터링하는 것을 방지
잘못된 호출을 방지하기 위해 사용자가 경계를 넘어 최소 거리를 이동하고 최소 20초 동안 경계의   같은 면에 있어야 함
가능한 현재 위치에 가까운 영역만 모니터링하고 이동 시 새 위치를 기반으로 목록 업데이트 권장 백그라운드에서 감지하고 동작할 수 있도록 백그라운드 모드의 Location Updates 활성화 필요


## Geocoding

CLGeocoder 를 이용해 지리적 좌표와 사용자에게 친숙한 지명 간 변환 처리 



* 참고: https://zeddios.tistory.com/614

# PhotoKit 

* 사진 앱이 관리하는 이미지, 비디오를 관리하는 애플의 기본 프레임워크 

## PhotoKit  으로 할 수 있는 것들 

* 이미지 및 비디오 내용 편집 
* 이미지, 비디오 표시, 재생
* 앨범, Moments(위치 정보등 )  smartAlbum , 사용자 정의 컬렉션 관리 


##  PhotoKit은 어떻게 이루어져 있나 

* 모든 PhotoKit 객체는 PHObject 를 상속하고 있습니다.
* Photos 프레임워크와 PhotosUI 프레임워크를 가지고 있습니다.


### PHObject
 * PhotoKit 객체의 상위 클래스입니다
 * 이 클래스를 직접 만들거나 사용하면 안됩니다. 하위 클래스인 PHAsset, PHAssetCollection, PHCollectionList, PHObjectPlaceholder로 작업해야합니다.

* 아래는 Photos 프레임워크의 주요 객체들입니다.

### PHAsset 

* 사진 라이브러리에 있는 하나의 asset을 나타내며 해당 asset의 메타데이터를 제공합니다.
* 이미지나 비디오 자체가 아니라 그것들의 메타데이터만 들고 있습니다.
* 이미지나 비디오를 불러오기 위해선 이 asset을 imageManager를 통해 전달하면 우리가 사용할 수 있는 UIImage 객체를 얻을 수있게 됩니다.
* asset objects are immutable  이 객체는 변경할 수 없습니다. 변경하기 위해선  PHAssetChangeRequest 객체를 생성하고 변경 요청을 보내야합니다.
### PHCollection

* asset colletion 을 위한 추상 슈퍼클래스.
* 사진, 비디오 집합을 위한 부모 클래스라고 볼 수 있습니다.
* 인스턴스를 직접 만들거나 이 인스턴스로 작업하면 안됩니다.
* 하위클래스인 PHAssetCollection 이나 PHCollectionList 를 통해 작업해야합니다.
* PHCollectionList 는 앨범이나 moment들의 집합과 같은 다른 collection을 포함하는 collection 입니다.

### PHAssetCollection

* Moment, 사용자 제작 앨범, 스마트 앨범과 같은 PHAsset 집합.
* 변경 불가능한 객체이며 PHAssetCollectionChangeRequest 객체를 만들어 변경을 요청해야합니다.

### PHCollectionList

* asset collection의 모음 
* colletio list 안의 객체를 검색하려면 fetchCollections(in: options:) 와 같은 클래스 메소드를 사용합니다.
* 사용자의 명시적인 승인이 필요합니다.


## PHPhotoLibrary


* 사용자의 공유 사진 라이브러리 접근 및 변경을 관리하는 shared 객체입니다. 
* NSObject 의 하위 클래스입니다.
* 로컬 디바이스에 저장된 asset 과 iCloud Photos에 저장된 객체를 관리합니다.
* 라이브러리가 변경될 때 전송된 업데이트 메세지 등록( 다른 앱에서 사진 라이브러리를 변경하거나 사용자가 변경을 했을때 옵저버를 등록해두면 변경 메세지를 받습니다.


## 사진이나 사진 앨범 가져오기 

* 사진을 가져올때 앱에서는 PHFetchResult 라는 리스트 객체를 받게 됩니다.

###  PHFetchResult

* PHAsset, PHCollection, PHAssetCollection, PHCollectionList 클래스 메소드를 사용하여 PHFetchResult 객체를 받을 수 있습니다.
*  이 객체를 받아 사진 라이브러리에 있는 에셋들을 사용 할 수 있습니다.

### PHFetchOptions

* 사진을 가져올 때( 검색할때) 사용되는 옵션입니다.
* 키를 사용해 검색을 하는 방법을 사용하는데 애플에서 정해놓은 제한된 키의 집합만 사용가능합니다.
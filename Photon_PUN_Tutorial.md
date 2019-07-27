# Photon_PUN_Tutorial

* PUN 임포트 및 설정 
* 개발 실습


## PUN 임포트 및 설정

* 에셋스토어에서 PUN2 에셋 다운로드, 임포
* PUN Wizard 에서 포톤 사이트로 들어가 프로젝트를 만들고 만들어진 프로젝트 안에 앱아이디를 붙여넣기


## 개발 실습

* 서버접속, 룹 접근과 생성
* PUN 콜백

### 서버접속 , 룸 접근과 생성 

1. 새로운 씬 생성하기 
2. 스크립트 작성
	* 게임 오브젝트 생성후 스크립트 붙이기


```swift
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

namespace Com.Mycompany.MyGame
{
    public class Launcher : MonoBehaviour
    {
		#region Private Serializable Fields

		#endregion

		#region Private Fields

		/// <summary>
		/// This client's version number. User are separated from each other by gameVersion(which allows you make breaking changes)
		/// </summary>
		string gameVersion = "1";

		#endregion

		#region MonoBehaviour Callbacks

		/// <summary>
		/// MonoBehaviour method called on GameObject by Unity during early initialization phase(단계).
		/// </summary>
		void Awake(){
			// #Critical
			// this makes sure we can use PhotonNetwork.LoadLevel() on the master client and all clients in the same room sync their level automatically 
			PhotonNetwork.AutomaticallySyncScene = true;
		}

		/// <summary>
		/// MonoBehaviour method called on GameObject by Unity during initialization phase(단계).
		/// </summary>
		void Start(){
			Connect();
		}

		#endregion
        
		#region Public Methods

		/// <summary>
		/// Start the connection process 
		/// - if already connected, we attempt joining a random room
		/// - if not yet connected, Connect this application instance to Photon Cloud Network
		/// </summary>

		public void Connect(){

			// we check if we are connected or not, we join if we are, else we initiate the connection to the server.
			if(PhotonNetwork.IsConnected){
				// #Critical we need at this point to attempt joining a Ramdom Room. If it fails, we'll get notified in OnJoinRandomFailed() and we'll create one
				PhotonNetwork.JoinRandomRoom(); // 네트워크에 연결되면 랜덤방에 입장.
			}else{
				// #Critical we must first and foremost(맨앞에 위치한) connect to Photon Online Server.
				PhotonNetwork.GameVersion = gameVersion;
				PhotonNetwork.ConnectUsingSettings();
			}
		}

		#endregion
    }
}
```


3. 유니티메뉴 Window/Photon Unity Networking/Highlight Photon Server Settings 에서 Pun Logging을 full로 설정
4. 실행 후 로그 확인

### PUN 콜백

* MonoBehaviourPunCallBacks 확장하기 
	1. Launcher 스크립트 편집 
	2. 기본클래스를 MonoBehaviourPunCallbacks상속받게 만듬 
	3. using Photon.Realtime; 추가



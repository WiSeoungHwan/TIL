#  Network

## URI(Uniform Resource Identifier)



* URN 과 URL을 포함한 개념 
*  인터넷의 자원을 유일하게 식별하기 위한 통합 자원 식별자 

### URL 

*  URI의 한가지 타입 
* 어떤 자원의 위치에 대한 절대 경로값을 지닌 문자열 
* 어떤 특정 주소 또는 파일 리소스에 접근하기 위한 주소값으로 흔히 HTTP로 시작하는 웹주소로 인식하는 경우가 많지만, URL의 한 형태에 해당하는 것으로  컴퓨터 네트워크 상의 자원을 모두 나타낼 수 있음 
* http: , https:, ftp: 등등 다양한 scheme 이 있다


### URN

*  위치에 독립적이고, 지속되는 형태의 자원을 가르키는 유일한 식별자 

예) urn:isbn:9788971991060 (국제표준도서번호)
     urn:uuid:6e8bc430-9c3a-11d9-9669-0800200c9a66 (UUID)

URL은 주소라고 볼 수 있고 URN 은 주민등록증이라고 볼 수있다.
주소는 변하지 않지만 주소에 해당하는 내부정보는 바뀔수 있지만 
주민등록번호는 변하지 않는다.

## IRI(International Resource Identifier)

* URI의 상위 개념 
* URI - ASCII character set 영어가 아닌 다른 언어로는 표현이 불가능했다.
* IRI - Fully supports international characters, (mostly UTF-8) 
  IRI 가 나오면서 다른 언어들로도 주소로 사용을 했다.


## Byte Ordering


### Big Endian

* Network Ordering 이라고도 함
    데이터를 상위 바이트부터 낮은 메모리 주소에 저장하는 형태
    e.g. 0x12345678 => 0x12 0x34 0x56 0x78
    낮은주소 --> 높은주소

### Little Endian

* Host Ordering 이라고도 하며, iPhone 도 여기에 해당 
   데이터를 하위 바이트부터 낮은 메모리 주소에 저장하는 형태 
   e.g. 0x12345678 => 0x78 0x56 0x34 0x12
   낮은주소 --> 높은주소


* Endian 통일 (Network Byte Order) 
- 모든 시스템이 저장하는 방식을 통일시키기 어려운 상황이므로  
모든 프로그램이 네트워크 전송 시, 약속된 공통의 Endian 을 사용하고 수신 측에서 변환
- 네트워크 바이트 오더 표준 : Big Endian 
* Byte 단위 전송 
- Endian 문제는 Byte 단위로 저장할 때 순서의 차이에 의해 발생하므로,  
애초에 1 Byte 단위로 데이터를 보내면 바이트 순서에 구애받지 않고 통신 가능


## Internet Protocol Suite

### TCP/IP Protocol Suite

인터넷 프로토콜 스위트(Protocol Suite)는 인터넷 네트워크에 쓰이는 프로토콜의 모음 TCP/IP 가 가장 많이 사용되기에 TCP/IP 프로토콜 스위트 또는 프로토콜 스택이라고도 함  HTTP, FTP, Telnet 등이 TCP/IP 기반 
- TCP (Transmission Control Protocol) : 패킷 전송 여부와 순서 보장의 특징 
- IP (Internet Protocol) : 비신뢰성(패킷 전송 보장 X)과 비연결성의 특징 (IPv4, IPv6)


4개의 계층 구조로 구성 (Link 계층을 Physical 과 구분할 경우 5단계) 
1. Application (응용) 계층 - HTTP, FTP, SMTP, POP, Telnet 등 
2. Transport (전송) 계층 - TCP, UDP, SCTP 등
3. Network 계층 - IP, ARP 등
4. Link 계층 - 이더넷, 토큰링, PPP , Wi-Fi 등 5. Physical (물리) 계층




* [ 4계층 Application ] 
데이터를 어떤 서비스를 활용해 주고 받을 것인지 정의한다. (HTTP, FTP 등) 
 
* [ 3계층 Transport ] 
데이터 송수신 방식을 결정한다. 
※ TCP - 연결지향형 서비스, 메시지 전달 보장 및 순서 보장  (카카오톡 등)
※ UDP - 비연결형 서비스, 메시지 전달 여부나 순서 보장이 되지 않는 대신 TCP 보다 빠른 속도  (FPS 게임 등 )
 
* [ 2계층 Network ] 
데이터가 어떤 라우터들을 거쳐 목적지로 전달될 지에 대한 전달 경로를 정의한다.  
※ IP 프로토콜은 비연결지향적이며, 신뢰할 수 없는 특성을 가지므로 신뢰성 확보를 위해 TCP 가 필요 
 
* [ 1계층 Link (Physical 포함) ] 
실제 데이터 패킷 전송을 책임진다.


## IPv6

IPv4 의 고갈 대비 및 기능 확장을 위해 제정한 차세대 인터넷 프로토콜
1994년 IETF (국제 인터넷 표준화 기구) 에서 채택
IPv6 주소 공간 - 128 bit (약 3.4 x 10 ^ 38) / IPv4 주소 공간 - 32 bit
16비트 (2옥텟)를 16진수로 표현하여 8자리로 표현
- 2001:0db8:85a3:08d3:1319:8a2e:0370:7334
- 대부분의 자리가 숫자 0 이므로 0000을 하나의 0으로 축약하거나 : 만을 남길 수 있음 (아래 주소는 모두 동일)

## HTTP

* protocols 중에 하나 
* HTTPS는 기존의 HTTP보다 보안이 더 강화된 프로토콜

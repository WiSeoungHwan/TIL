#  Git 
깃에 대한 정리

## _add 하고 commit 하고 push 하기_ 

 ### __add__ 
 `git add 파일명` 
 * 파일을 스테이지에 올린다.
 
 ### __commit__
 `git commit -m "변경내용"` 
*  commit을 하게 되면 add를 해서 스테이지에 올라갔던 파일들이 commit 된다.
* 여기까지는 원격 저장소에 반영이 되지 않는다.
* `-m ` 은 commit message 를 넣어주란 말이고 뒤에 `""` 안에 commit message 를 넣는다.
 
 ### __push__
 `git push origin master ` 
 * push 를 하면 commit 되었던 로컬 저장소가 원격 저장소로 올라가게 된다.
 * `origin`  은 기본적으로 생성된 이름이다.
 * `master` 는 master 에서 생성된 여러 개의 Branch가 있을 수 있는데  
    Branch 에 넣지 않고 master에 반영을 시키겠다는 말이다.
    
    ## 일일 커밋 할때 사용할 것 
   1. `git status` 로 수정된 파일과 commit 되지 않은 파일 확인
   2.  `git add ` 로 스테이지에 올리기 
   3. `git commit` 으로 commit하기 
   4. `git push` 로 원격 저장소에 반영 
   5. [github](https://github.com/WiSeoungHwan/TIL) 에서 확인!
    
    
 



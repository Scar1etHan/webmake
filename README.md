# 화장품 쇼핑몰 프로젝트
KIC 캠퍼스(국비학원) 에서 진행한 화장품 쇼핑몰 팀 프로젝트

## 프로젝트 개요
* 소개 :
  * Skin dot 화장품 사이트를 참고하여 만든 화장품 쇼핑몰 사이트 입니다.

* 개발 인원 :
  *  명

* 담당 역할 :
  * ERD 모델링 (DB 설계)
  * 발표 PPT 제작
  * 문의 게시판 (프론트 , 백엔드)
  * 회원 (프론트, 백엔드)
  * 주문 (프론트, 백엔드)

* 개발 기간
  * 2023/07/03 ~ 2023/09/08 (67일)

* 성과 및 결과
  * 기간내에 담당했던 기능들 구현 완료


## 사용 기술 스택
* ### 사용한 언어 :
  * HTML
  * CSS
  * JS
  * JAVA
    
* ### 사용한 DB : 
  * Oracle 11g
   
* ### 사용한 툴 : 
  * Eclipse 2023-03
  * STS 3.9.14 (Spring)
  * Bootstrap 5.0.2
    
* ### 사용한 서버 :
  * Aphache-tomcat 9.0.75


## 담당 구현 기능
* 회원 관련
  * 전체 회원 목록 보기(관리자 페이지) 및 CRUD
  * 회원가입시 아이디 중복 체크 및 비밀번호 일치 각 입력칸 유효성 검사
  * 로그인, 로그아웃
  * 아이디 찾기, 비밀번호 찾기

* 문의 게시판
  * 게시글 목록 및 CRUD
  * 게시글의 댓글 개수 표시
  * 검색 및 페이징 처리
  * 게시글 내에 댓글 목록 및 작성

* 주문
  * 전체 주문 내역 보기(관리자 페이지)
  * 로그인한 사람의 주문 내역 보기
  * 주문 상세 내역 보기
  * 주문 배송 상태 업데이트(관리자 페이지)
 
# 회원 관련 구현 이미지
* 회원 가입 약관 창 ( js로 버튼 필수 버튼 2개 체크 했을 경우에만 회원가입 버튼 활성화 시킴 )
    
![약관 선택 전](https://github.com/Scar1etHan/webmake/assets/137043086/c36c36e8-f380-47b6-bacc-a620c813d4ab)

![약관 선택 후](https://github.com/Scar1etHan/webmake/assets/137043086/e5d59a34-9986-4d0a-a706-b58a1243577a)

* 회원가입시 유효성 검사 (프론트와 백엔드 둘 다 유효성 검사)
  
![각 항목당 유효성 검사](https://github.com/Scar1etHan/webmake/assets/137043086/064703c0-587a-4539-a18c-a823583c14c2)

![각 항목당 유효성 검사3](https://github.com/Scar1etHan/webmake/assets/137043086/9f5f51c5-1e9b-4884-8efa-3b0a43841bb7)

* 회원 가입 성공시

![회원 생성 성공 알림창](https://github.com/Scar1etHan/webmake/assets/137043086/8a5972f6-a579-493e-a0da-c4125c5a29b2)

* 내 정보(마이페이지 : 정보 상세 보기 및 수정, 삭제, 주문 내역)

![회원 정보 상세보기1-1](https://github.com/Scar1etHan/webmake/assets/137043086/f585109c-291a-480e-a689-a65a611cf010)

![회원 정보 상세보기1-2](https://github.com/Scar1etHan/webmake/assets/137043086/72cadfac-9bc5-4d80-9512-0436ff853dce)


* 로그인 (백엔드에서 아이디와 비밀번호를 검사한후 아이디나 비밀번호가 틀릴경우 틀린거에 대한 메세지를 프론트로 보내서 알림 출력하게함)

![로그인 성공](https://github.com/Scar1etHan/webmake/assets/137043086/1f19b9ce-a163-4aab-88b1-ed9d6426249b)

![로그인 성공2](https://github.com/Scar1etHan/webmake/assets/137043086/bb3d7750-6f44-4973-8db1-a22431e82bb0)

* 아이디 비밀번호 찾기 (각 입력한 값과 일치하는 아이디와 비밀번호를 팝업창을 통해 알려줌)
      
![아이디 찾기](https://github.com/Scar1etHan/webmake/assets/137043086/f72c11ae-e0dd-47a2-ba51-00b1e508b9f2)
     
![비밀번호 찾기](https://github.com/Scar1etHan/webmake/assets/137043086/b810aee8-0134-41d3-880b-9fe344051c53)


# 문의 게시판 관련 구현 이미지
* 문의 게시판
  * CRUD, 게시글 제목 옆 댓글 개수 표시
  * 게시글 내에 댓글 목록 및 작성
  * 작성자만 수정 삭제 가능
  * 검색 및 페이징

![문의 게시판 첫 화면](https://github.com/Scar1etHan/webmake/assets/137043086/a155b69e-2cca-4440-9f27-5a2ea1522de9)

* 댓글 작성

![댓글 작성](https://github.com/Scar1etHan/webmake/assets/137043086/3e95cd0b-57c4-486c-ae7d-9fe9d53d2eaa)

![댓글 작성 확인](https://github.com/Scar1etHan/webmake/assets/137043086/466eb663-bbdf-487c-b4a2-1374625ba573)


# 주문 관련 구현 이미지
* 주문 내역
  
![주문내역 있는경우](https://github.com/Scar1etHan/webmake/assets/137043086/feec914b-ebd3-41b5-9f8b-2f1e65b4ea4d)

* 주문 상세 내역

![주문상세내역2](https://github.com/Scar1etHan/webmake/assets/137043086/8e9f9e1a-f05e-4f2e-af08-dceae35772ca)


# 관리자 관련 주현 이미지
* 회원 전체 목록 (회원 리스트 및 회원 수정 삭제 가능)

![회원 전체 목록](https://github.com/Scar1etHan/webmake/assets/137043086/f01a639e-a429-4bd2-8f07-ebd42c4d20b6)

* 주문 전체 목록 (주문 리스트 및 주문 배송 상태 변경 가능)

![주문 전체 목록](https://github.com/Scar1etHan/webmake/assets/137043086/ccde12e1-13a4-4936-bde9-e4b24e9ba213)

* 배송 변경
  
![배송 상태 선택](https://github.com/Scar1etHan/webmake/assets/137043086/563f70ff-6420-47f8-ba58-6daf15571a20)

![배송 상태 선택완료](https://github.com/Scar1etHan/webmake/assets/137043086/7f3ae847-bd3a-4ab6-85c0-3457f8e26cce)





 

## 쇼핑몰 프로젝트에서 맡은 담당 : 문의 게시판(인당 게시판 하나씩), 회원, 주문

게시판 : 게시물 목록 보기, 게시물 작성 (C), 게시물 상세보기 (R), 게시물 수정 (U), 게시물 삭제 (D), 게시물 조회수 증가 
        게시물 목록 검색 및 페이징 처리, 게시글 내에 댓글 목록 및 작성, 게시물 댓글 개수 표시

회원 : 전체 회원 목록 보기, 회원 목록 페이징처리 및 검색, 회원 가입(모든 입력칸 유효성 검사 실행) (C), 회원 정보 상세보기 (R), 회원 정보 수정 (U), 회원 정보 삭제 (D), 로그인 및 로그아웃 (session), 아이디 및 비밀번호 찾기

주문 : 전체 주문 내역 목록 보기, 로그인한 사람 주문 내역 보기, 주문 내역 상세 보기 (R), 배송 상태 변경기능 (U)

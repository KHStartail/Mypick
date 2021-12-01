# MY PICK

#### 팀원 : 심현수, 전우빈, 임진영, 김지은, 이솔미

## 수행기간
2021년 10월 19일 ~ 11월 24일

## Contetns

1. [개요](#개요)
2. [설계의 주안점](#설계의-주안점)
3. [사용기술 및 개발환경](#사용기술-및-개발환경)
4. [프로젝트 기능 구현](#프로젝트-기능-구현)
5. [주요기능](#주요-기능)
6. [Document](#Document)
------------
## 개요
국제적으로 주목받고 사랑받는 문화시장에서 수많은 팬덤의 팬들이 한번에 본인이 좋아하는 아이돌을 선택해
간편하게  서포팅할 수 있는 사이트입니다.



## 설계의 주안점
1. 핸드폰 인증을 통한 아이디 비밀번호 찾기로 보안성을 높임
2. 간편한 로그인을 위해 소셜로그인을 구현
3. 썸머노트 게시판을 이용하여 게시글과 댓글에 이미지와 동영상 첨부 기능 구현
4. 쿠키를 이용한 조회수 추가 기능 구현
5. 참여 버튼을 클릭하여 일정 인원이 채워지면 게시판 이동 기능 구현
6. 이미지와 별점 첨부가 가능한 리뷰 기능과 리뷰에 대한 답글 기능 구현
7. 장바구니에 상품을 담고 선택 삭제/결제가 가능하도록 구현
8. 상품 리스트에서 줌인 기능 구현
9. 다양한 아이돌을 한 눈에 볼 수 있는 프로필 리스트 구현

## 사용기술 및 개발환경
![KakaoTalk_20211124_121545111](https://user-images.githubusercontent.com/82746841/143168920-7f9057d8-8c7e-43b4-95e1-f59d96219cbc.png)
Category | Detail
---- | ----
FrontEnd | HTML5, JS, CSS3, JQuery
BackEnd | JAVA(JDK 1.8), Servlet, Mybatis, Spring(4.3.13)
OS | Windows10
Library & API | kakao, GSON, summernote, Iamport, webSocket, toast, zoomer,coolsms
IDE | Eclipse, Visual Studio Code
Server | Tomcat(v8.5)
Document | Google Drive, draw.io, ERDCloud, zeplin, notion
CI | Github
DataBase | Oracle

## 프로젝트 기능 구현
+ 심현수
  + 아이돌
    + 아이돌 이름, 그룹 이름 검색 기능
    + 아이돌 프로필 클릭 시 그룹 커뮤니티 이동 기능
    + 아이돌 프로필 생성, 파일 업로드, ajax를 이용한 출력 기능
    + 아이돌 프로필 수정, 파일 수정, ajax를 이용한 출력 기능.
    + 아이돌 프로필 삭제 기능.
  + 마이페이지 
    + 마이페이지 유저 정보 수정 클릭 시 수정페이지 이동
    + 정보수정 페이지 ajax를 이용해 프로필 이미지 업로드 실시간 출력

+ 전우빈
  + 커뮤니티
    + 게시글 등록/수정/삭제(SummerNote) 구현
    + 댓글 등록/수정/삭제(SummerNote) 구현
    +  어드민계정으로 접속시 메인 이미지 수정/삭제 구현
    + 쿠키에 따른 조회수 구현
    +  좋아요 구현
    +  에디터 summernote API 사용 구현
    +  게시글 디테일, 리스트 구현
    +   다중파일 업로드(SummerNote) 구현
  + 마이페이지 
    + 작성한 글 보기 구현

+ 김지은
  + 모집중 서포팅
    + 모집중 서포팅 목록 출력시 카드 형식(bootstrap사용, 페이징처리)
    + 카드의 참여버튼 클릭시 참여인원이 추가되거나 취소되는 기능(좋아요 유사 기능)
    + 서포팅 모집시 air-datepicker api를 사용한 캘린더에서 날짜선택가능(라이브러리 사용)
    + 서포팅 모집시 대표 이미지 미리보기와 다중파일 업로드 기능(javascript사용)
    + 그룹이름으로 검색가능
  + 진행중 서포팅
    + 아임포트 api를 통해 기타금액을 합산해 결제기능 구현
    + 댓글 등록/수정/삭제/신고/목록 ajax 구현
    + 그룹이름으로 검색가능
  + 마이페이지
    + 내가 결제한 서포팅 내역과 결제일을 볼 수 있도록 구현
    + 내가 쓴 서포팅 글을 볼 수 있도록 구현

+ 임진영
  + 로그인/ 로그아웃
    + 알맞은 입력값 입력후 로그인버튼 클릭시 로그인 기능 
    + 로그인 후 로그아웃 클릭시 로그아웃이 되는 기능 
  + 회원가입
    + 해당값을 입력한 후 핸드폰 인증이 완료되면 회원가입이 되는 기능 
    + 회원정보 수정
    + 아이디를 제외한 정보수정을 원할경우에 원하는 값을 입력하고 수정페이지에서 프로필사진 등록 변경이 가능한 기능 
  + 아이디/ 패스워드찾기
    +  아이디찾기의 경우 유저 전화번호와 비밀번호입력시 핸드폰 인증완료 후 아이디를 보여주는 기능 
    + 패스워드변경의 경우 유저아이디와 비밀번호가 일치하면 핸드폰인증이 이루어지고 비밀번호 변경이 가능한 기능 
  + 카카오간편 로그인 
    + 카카오 간편 로그인의 경우 최초 로그인일때 정보 동의한 부분을 제외한 필수 입력값 입력을 위해 회원가입 창으로 넘어가는 기능 
    + 최초 로그인 이후에는 버튼 클릭시 바로 로그인이 되는 기능
  + 유효성체크/ 아이디중복 확인
    + 회원가입의 경우 유효성체크와 아이디중복확인 이후 문제가 없을때 가입되는 기능 
    + 아이디찾기와 비밀번호체크의 경우 유효성체크를 통해 원하는 값을 입력했을때 가입이되는 기능
  + 마이페이지
    + 정보수정페이지 사용이 편리하도록 프론트 구현
+ 이솔미 
  + 굿즈
    + 다중파일 업로드를 통해 대표 이미지와 상세 이미지를 분리하도록 구현
    + 상품 썸네일 이미지 마우스 휠로 확대하는 기능
    + 해당 굿즈의 아이돌 그룹과 관련된 상품들을 슬라이드로 확인 할 수 있도록 구현
    + 그룹이름, 상품이름, 아이돌이름으로 검색할 수 있는 기능
  + 리뷰/답글
    + 이미지와 별점을 첨부하여 리뷰를 남기는 기능
    + 리뷰에 답글을 남길 수 있는 기능
  + 장바구니
    + 수량을 정하여 장바구니에 상품 담기
    + 장바구니에 담긴 상품을 개별 선택하여 삭제할 수 있는 기능
    + 상품을 개별 선택하여 총 합계를 확인 할 수 있는 기능
  + 결제
    + 상품 디테일 페이지 내에서 수량을 정하고 바로 결제페이지로 넘어가는 기능
    + 장바구니에서 선택된 상품 여러개를 결제할 수 있는 기능
    + 개인정보 입력 시 유효성 검사 기능
    + 주소 검색 api 기능
    + 약관 동의 체크박스 유효성 검사 기능  
    + 아임포트 api를 통한 결제 기능
    + 마이페이지에서 현재까지의 결제 내역을 확인 할 수 있도록 구현


## 주요 기능
### 1.아이돌

![메인화면](https://user-images.githubusercontent.com/90733952/143178576-04b93b58-1258-497a-9843-51a9c8a8466d.gif)

< 메인 검색창 >
![검색창](https://user-images.githubusercontent.com/82930760/143171535-1b10a916-81d4-42c3-b302-2a4af5b69942.jpg)


< 아이돌 리스트 >

![아이돌리스트](https://user-images.githubusercontent.com/82930760/143171182-4a88a053-f1f3-4c71-8448-814748b9edc7.jpg)


< 아이돌 등록 >

![아이돌등록](https://user-images.githubusercontent.com/82930760/143171187-33560cfa-dfd0-4b36-9431-3d7724c7adb6.jpg)


< 프로필 생성 >

![프로필생성](https://user-images.githubusercontent.com/82930760/143171189-0567c80c-3640-4c06-9c2d-f14254b0186c.jpg)


< 프로필 수정 >

![프로필수정](https://user-images.githubusercontent.com/82930760/143171195-adbb14f0-0b11-4a94-9f6f-662a1e943183.jpg)


< 아이돌 삭제 >

![삭제](https://user-images.githubusercontent.com/82930760/143171206-d5538d38-8217-4d75-93cf-7b1a1a4e21e7.jpg)



### 2.로그인

![01](https://user-images.githubusercontent.com/88823258/143178562-0d348c0f-76aa-476e-b119-a8afd70add61.PNG)

![02](https://user-images.githubusercontent.com/88823258/143178563-cd9db92e-f429-4217-ac13-70cdbe4000e3.PNG)


< 아이디 비밀번호 찾기 >
![03](https://user-images.githubusercontent.com/88823258/143178586-139528e9-1f59-4732-9af8-b5448d6d3f29.PNG)

![05](https://user-images.githubusercontent.com/88823258/143178587-12ee9b31-588a-4469-8abc-c474238bcdda.PNG)

![06](https://user-images.githubusercontent.com/88823258/143178588-c9fbffaa-4006-413e-b695-366027962633.PNG)


< 카카오 로그인 >
![07](https://user-images.githubusercontent.com/88823258/143178590-b94fb44d-0c75-4e01-a43a-26fea8aca493.PNG)

![08](https://user-images.githubusercontent.com/88823258/143178592-c2a190eb-da55-4aab-9f1d-4e93eada68c8.PNG)


< 회원가입 >
![09](https://user-images.githubusercontent.com/88823258/143178595-564c9d6a-0aa8-46e5-93db-607a676af044.PNG)

![10](https://user-images.githubusercontent.com/88823258/143178596-13d6a97a-87ae-4cb0-b582-f27ac85d2944.PNG)

![11](https://user-images.githubusercontent.com/88823258/143178581-be1dc1d2-06ae-476e-b874-b3ba513c16b4.PNG)


< 마이페이지 정보 수정 >
![12](https://user-images.githubusercontent.com/88823258/143178582-ce37b3b9-a789-4766-8fd6-5364edfa0c2f.PNG)

![13](https://user-images.githubusercontent.com/88823258/143178583-a2c2b999-8ff3-4e1b-a40c-c412068e3d67.PNG)

![14](https://user-images.githubusercontent.com/88823258/143178585-ed348f5b-64db-468d-a71b-2c156e6cc356.PNG)





### 3.커뮤니티

< 게시글 리스트 및 작성 및 좋아요 >

![게시글 리스트 및 작성 및 좋아요(1)](https://user-images.githubusercontent.com/90733952/143178517-9af5cea6-d93d-419e-aefa-2d28eaf3a058.gif)


< 댓글 >
![댓글 이미지 작성(2)](https://user-images.githubusercontent.com/90733952/143178541-dd116009-6f10-44cc-bd91-acb14e6a9608.gif)

![댓글 수정(3)](https://user-images.githubusercontent.com/90733952/143178547-1fefc88b-e424-42dd-b4ed-7e81c77d52d0.gif)


< 게시글 수정 >

![게시글수정(4)](https://user-images.githubusercontent.com/90733952/143178558-72c56517-fbd1-4d73-b7d0-4c6d90eabd65.gif)



### 4.굿즈

< 굿즈 리스트 >

![굿즈리스트](https://user-images.githubusercontent.com/82746841/143171528-ff079d8c-d878-483a-9d65-e7cab916b3b3.jpg)

![굿즈확대](https://user-images.githubusercontent.com/90733952/143178569-2afcfc4a-39bc-422f-92a1-a3d627c493a4.gif)

< 굿즈 디테일 >

![굿즈디테일1](https://user-images.githubusercontent.com/82746841/143171545-72285257-eeaf-4895-bed8-5859b4402064.jpg)

![굿즈디테일-슬라이드](https://user-images.githubusercontent.com/82746841/143171696-e9824adf-d30a-4a1c-a9e9-c2877ec6b598.jpg)


< 리뷰/답글 >
![리뷰작성](https://user-images.githubusercontent.com/82746841/143171705-277367ef-d9fc-4a1b-8c67-c3f88621296c.jpg)

![리뷰](https://user-images.githubusercontent.com/82746841/143171715-600809fc-ba0a-426f-93f2-ae8279b097f0.jpg)

![굿즈디테일-답글](https://user-images.githubusercontent.com/82746841/143171729-114d9f27-9c05-4c6a-a6c8-3d09f0e36ba7.jpg)

![굿즈디테일-답글2](https://user-images.githubusercontent.com/82746841/143171737-3c1790b9-5bad-4ab5-bedc-4d8c4db1143c.jpg)


< 굿즈 결제 >

![굿즈결제1](https://user-images.githubusercontent.com/82746841/143171763-5f49cadf-c508-4c54-b858-d4827283b61b.jpg)

![굿즈결제2](https://user-images.githubusercontent.com/82746841/143171767-2c1a1ee5-4270-48a7-a114-6a5e3b0d6d2d.jpg)

![굿즈결제3](https://user-images.githubusercontent.com/82746841/143171772-7d19b35a-3fd9-4b7e-8979-44641839e174.jpg)

![굿즈결제4](https://user-images.githubusercontent.com/82746841/143171777-e93563f5-3265-4e0f-a8a8-beb96528d767.jpg)

![굿즈결제5](https://user-images.githubusercontent.com/82746841/143171782-95d5d2fa-6091-41ce-918d-03b537d2d2b0.jpg)

![굿즈결제알람](https://user-images.githubusercontent.com/82746841/143171794-b0af2bd0-3289-4c30-8a68-beb666632494.jpg)

![굿즈결제내역](https://user-images.githubusercontent.com/82746841/143171802-d1dbb888-653c-4c7e-b835-e25a67f3139e.jpg)


< 굿즈 장바구니 >

![굿즈장바구니1](https://user-images.githubusercontent.com/82746841/143171818-a27e1939-fb50-4901-915a-a6ec2fe0d8b8.jpg)

![장바구니1](https://user-images.githubusercontent.com/82746841/143171826-6f219612-4f62-4a27-85dd-22770b26cd3f.jpg)

![장바구니결제](https://user-images.githubusercontent.com/82746841/143171854-7e3eadd0-0c78-45bb-9d16-a5d5f1a361b2.jpg)



### 7.서포팅


< 모집중 목록 >
![모집중목록](https://user-images.githubusercontent.com/86291683/143179243-4851c1e2-26d7-48c6-9339-b8e6525889c7.PNG)

< 모집중 검색 >

![모집중검색](https://user-images.githubusercontent.com/86291683/143179440-fc10b5ec-bfdd-435b-b4cc-aac93316911c.PNG)

< 모집중 상세 >


![모집중목록](https://user-images.githubusercontent.com/86291683/143179301-ea35a6ed-8786-4721-85f5-58199ceacaa7.PNG)

< 서포팅 수정 >
![모집중목록](https://user-images.githubusercontent.com/86291683/143179389-2976d57d-c35d-465b-96e8-6145980ebf28.PNG)

< 모집중 상세2 >
![모집중목록](https://user-images.githubusercontent.com/86291683/143179401-53b93396-a349-4b3a-b737-409ac89304fb.PNG)

< 진행중 리스트 >
![모집중목록](https://user-images.githubusercontent.com/86291683/143179458-b8e5a003-599a-4a2c-bfcc-c89224c4c4c1.PNG)

< 진행중 검색 >

![모집중목록](https://user-images.githubusercontent.com/86291683/143179472-be05bf37-0571-4f8b-bec0-d7c091fa7bc6.PNG)

< 진행중 상세 >

![모집중목록](https://user-images.githubusercontent.com/86291683/143179585-8ae711a6-d5d0-4029-a468-504080f8e23a.PNG)

< 결제 >

![모집중목록](https://user-images.githubusercontent.com/86291683/143179602-ecdf084f-e5f7-4d58-875e-0d96955b2bf2.PNG)

![모집중목록](https://user-images.githubusercontent.com/86291683/143179507-d5b1a5b1-c05d-4589-8af7-4d5c835e45cf.PNG)
< 서포팅 결제 내역 >
![모집중목록](https://user-images.githubusercontent.com/86291683/143179537-19ac65a6-0cb7-4b30-8088-bd82469da976.PNG)

< 내가 쓴 서포팅 >
![모집중목록](https://user-images.githubusercontent.com/86291683/143179509-d0bd2a71-8862-4739-83c0-23d5d41856e2.PNG)





## Document
### 1. ERD
![95e327785123db42](https://user-images.githubusercontent.com/82746841/143170706-173993c1-94fb-4d58-bc8c-00c22d9dc70f.png)




<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=006F3E&height=230&section=header&text=Park%20HereRo&fontColor=7DB249&fontSize=90" />
</div>

### 팀명
**`Park_HereRo`**

### 팀원 소개
<div align="center">

|<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/memoji/itsjaeya.png" height="150" />|<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/memoji/holyplace129.png" height="150" />|<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/memoji/JihwanB.png" height="150" />|<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/memoji/ecoh96.png" height="150" />|<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/memoji/hyeonjin-dot.png" height="150" />|
|:---:|:---:|:---:|:---:|:---:|
|[🎸 팀장 이윤재](https://github.com/itsjaeya)|[🤑 팀원 권성지](https://github.com/holyplace129)|[🐶 팀원 백지환](https://github.com/JihwanB)|[🤭 팀원 오은철](https://github.com/ecoh96)|[🤎 팀원 정현진](https://github.com/hyeonjin-dot)|

</div>

</br>

## 프로젝트 개요

### 프로젝트 소개
극심한 주차난에 시달리는 현대 운전자들에게 영화 속 히어로처럼 ‘나의 주차장을 찾아주는 히어로’를 만들어주고자 `Park_HereRo` 프로젝트가 시작되었습니다.

평소 방문하던 곳이 아닌 익숙치 않은 지역에 방문했을 때 주차 공간을 찾으며 시간을 소비하는 일은 어느 운전자에게나 발생하며, 이는 운전자들의 큰 고충으로 작용합니다.

방문하고자 하는 지역의 주차장이 어디에 있는지 사전에 알아보거나, 부담스러운 주차비를 피해 비교적 저렴한 주차장이 어디에 위치해 있는지 검색하여 한 눈에 파악할 수 있습니다.

### 프로젝트 필요성
서울지방경찰청의 연도별 서울시 불법주정차 위반건수에 따르면, 2014년 7,540건에서 2015년 15,439건으로 전년 대비 두 배 이상 증가한 수치를 보이고 있습니다.

경기개발연구원에서 제공하는 불법주차를 하는 이유에 대한 조사 결과를 확인해보면, 36.4%의 응답자가 주차 요금이 비싸서라고 답변했고 그 뒤로 주차장이 없어서, 주차장이 너무 멀리 있어서 등의 답변이 뒤따랐습니다.

하지만 실제 주차장 면적 자체는 매년 꾸준히 늘고 있습니다. 2016년 기준 서울시 주차장 확보율은 129.2%로, 자동차 등록대수보다 주차 면수가 더욱 가파르게 증가하고 있습니다.

즉, 운전자들은 단순히 주차 공간이 부족해서가 아니라, 부담스러운 주차 요금과 인근 주차장에 대한 정보 부족으로 인해 불법주정차라는 잘못된 선택을 하고 있는 실황입니다.

### 프로젝트 주요 기능
유저는 회원가입 후 본 서비스를 이용할 수 있습니다.

유저는 주소, 운영 시간, 시간별 정산 요금 등을 기준으로 원하는 조건에 따라 맞춤형 주차장 검색이 가능합니다.

유저는 결제 금액에 따라 마일리지를 지급받으며, 적립된 마일리지는 유저의 요구에 따라 주차 금액에서 차감해서 사용 가능합니다.

유저는 커뮤니티 게시판을 활용하여 글을 게시할 수 있으며, 다른 회원들과 상호작용이 가능합니다.

### 사용한 기술 스택
<div align="center">
  
  |<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/techstack/heidisql.png" height="100" />|<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/techstack/datagrip.png" height="100" />|<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/techstack/mariaDB.svg" height="100" />|<img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/techstack/erwin-logo.svg" height="100" />|
  |:---:|:---:|:---:|:---:|
  |Heidisql|Datagrip|MariaDB|ERwin Data Modeler|
  
</div>

</br>

## 요구사항 명세서
[요구사항 명세서 전체보기](https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/요구사항명세서.pdf)
<div align="center">

  <img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/요구사항명세서.jpeg" height="200"/>

</div>

</br>

## ERD
<div align="center">

  <img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/ERD.png" height="600"/>

</div>

</br>

## DDL
```sql

USE herero;

CREATE TABLE admin_tbl(
	adminID			int	        PRIMARY KEY AUTO_INCREMENT,
	adminName		VARCHAR(20)	NOT NULL
);

CREATE TABLE user_tbl(
  userID			VARCHAR(20)	PRIMARY KEY,
  adminID			INT,
  passwd      VARCHAR(20) NOT NULL,
  userName   	VARCHAR(20) NOT NULL,
  payOption   CHAR(10)    NOT NULL,
  mileage     INT,
  userRate    VARCHAR(20)	NOT NULL,
  blockYN     CHAR(1)     DEFAULT 'N',
  phoneNum		VARCHAR(20)	NOT NULL,
  totalPaid		INT,
  CONSTRAINT	fk_user_adminID	FOREIGN KEY	(adminID) REFERENCES	admin_tbl	(adminID)
);

CREATE TABLE userCarDetail_tbl(
	carNum		  VARCHAR(20) PRIMARY KEY,
	userID		  VARCHAR(20) NOT NULL,
	carType		  VARCHAR(20) NOT NULL,
	compCarYN	  CHAR(1)     DEFAULT 'N',
	elecCarYN	  CHAR(1)     DEFAULT 'N',
	CONSTRAINT	fk_userCarDetail_userID		FOREIGN KEY	(userID)	REFERENCES user_tbl	(userID)
);

CREATE TABLE post_tbl(
	postID		  INT           AUTO_INCREMENT,
	userID		  VARCHAR(20),
	title			  VARCHAR(45)   NOT NULL,
	postContent	VARCHAR(300)  NOT NULL,
	postDate		DATE          DEFAULT CURRENT_DATE,
	postDel		  CHAR(1)       DEFAULT 'N'CHECK(postDel IN ('Y','N')),
	PRIMARY KEY (postID),
	CONSTRAINT fk_post_userID	FOREIGN KEY (userID) REFERENCES user_tbl (userID) 
);

CREATE TABLE comment_tbl(
	commentID	      INT AUTO_INCREMENT,
	postID		      INT,
	userID		      VARCHAR(20),
	commentContent	VARCHAR(210),
	commentDate	    DATE DEFAULT CURRENT_DATE(),
	commentDel      CHAR(1)  DEFAULT 'N' CHECK(commentDel IN ('Y','N')),
	PRIMARY KEY (commentID),
	CONSTRAINT fk_commnt_postID FOREIGN KEY (postID) REFERENCES post_tbl(postID) #별칭추가
);

CREATE TABLE eventinfo_tbl(
	eventID			  INT			PRIMARY KEY,
	adminID		    INT			NOT NULL,
	eStartDate		DATE		NOT NULL,
	eEndDate		  DATE		NOT NULL,
	eventName		VARCHAR(50)	NOT NULL,
	CONSTRAINT	fk_promo_adminID FOREIGN KEY (adminID) REFERENCES admin_tbl (adminID)
);

CREATE TABLE promo_tbl (
	promoID			VARCHAR(20)	PRIMARY KEY,
	pStartDate  DATE		    NOT NULL,
	pEndDate		DATE		    NOT NULL,
	discPrice		VARCHAR(10)	NOT NULL,
	eventID		  INT			    NOT NULL,
	CONSTRAINT	fk_eventinfo_event_id FOREIGN KEY (eventID) REFERENCES eventinfo_tbl (eventID)
);

CREATE TABLE parkingPrice_tbl(
   parkPriceID     INT  AUTO_INCREMENT,
   basePrice       INT  DEFAULT 0,
   extraUnitPrice  INT  DEFAULT 0,
   1dayPrice       INT  DEFAULT 0,
   1monthPrice     INT  DEFAULT 0,
   CONSTRAINT PRIMARY KEY (parkPriceID)
);

CREATE TABLE chargePrice_tbl(
	parkPriceID INT,
	enterTime   TIME,
	exitTime    TIME,
	ticketType  VARCHAR(1),
	chargePrice	INT,
	CONSTRAINT PRIMARY KEY (parkPriceID),
	CONSTRAINT fk_chargePrice_parkPriceID FOREIGN KEY (parkPriceID) REFERENCES parkingPrice_tbl (parkPriceID)
);

CREATE TABLE actualPaid_tbl(
	paidID 		    INT         PRIMARY KEY,
	parkPriceID   INT,
	userID 		    VARCHAR(20),
	payidYN   	  VARCHAR(1)  CHECK(payidYN IN ('N','Y')),
	mileageUsed   INT,
	actualPaid 	  INT,
	promoID 		  VARCHAR(20),
	CONSTRAINT fk_actualPaid_parkPriceID FOREIGN KEY (parkPriceID) REFERENCES chargePrice_tbl (parkPriceID),
	CONSTRAINT fk_actualPaid_userID FOREIGN KEY (userID) REFERENCES user_tbl (userID),
	CONSTRAINT fk_actualPaid_promoID FOREIGN KEY (promoID) REFERENCES promo_tbl (promoID)
);

CREATE TABLE parkTime_tbl(
	parkTimeID    INT AUTO_INCREMENT,
	baseTime      INT,
	extraUnitTime	INT,
	CONSTRAINT PRIMARY KEY (parkTimeID)
);

CREATE TABLE parkinglot_tbl(
	parkingID		  VARCHAR(20),
	parkPriceID	  INT,
	parkTimeID	  INT,
	parkName		  VARCHAR(100),
	parkTel			  VARCHAR(15),
	parkCap			  INT,
	elecChargeYN	CHAR(1)     DEFAULT 'N' CHECK (elecChargeYN IN ('N','Y')),
	payMethod		  VARCHAR(50) DEFAULT '현금, 카드, 계좌이체',
	CONSTRAINT PRIMARY KEY (parkingID),
	CONSTRAINT fk_parkinglot_parkPriceID FOREIGN KEY (parkPriceID) REFERENCES parkingPrice_tbl(parkPriceID),
	CONSTRAINT fk_parkinglot_parkTimeID FOREIGN KEY (parkTimeID) REFERENCES parkTime_tbl(parkTimeID)
);

CREATE TABLE address_tbl(
	parkingID   VARCHAR(20),
	subAddr1		VARCHAR(30) DEFAULT '', # 광역시, 특별시, 도
	subAddr2		VARCHAR(20) DEFAULT '', # 시군구
	subAddr3		VARCHAR(20) DEFAULT '', # 읍면동리
	subAddr4		VARCHAR(20) DEFAULT '', # 지번
	CONSTRAINT fk_address_parkingID FOREIGN KEY (parkingID) REFERENCES parkinglot_tbl (parkingID)
);

CREATE TABLE openingDays_tbl (
   parkingID       VARCHAR(20),
   openingDays     VARCHAR(40),
   wdOpenTime      VARCHAR(10),
   wdCloseTime     VARCHAR(10),
   satOpenTime     VARCHAR(10),
   satCloseTime    VARCHAR(10),
   hdOpenTime      VARCHAR(10),
   hdCloseTime     VARCHAR(10),
   CONSTRAINT PRIMARY KEY (parkingID),
   CONSTRAINT fk_openingDays_parkingID FOREIGN KEY (parkingID) REFERENCES parkinglot_tbl
);


```

</br>

## 테스트케이스
<div align="center">

  <img src="https://github.com/beyond-sw-camp/be05-1st-Peter_Parker-Park_HereRo/blob/main/images/testcases.jpg" height="600"/>

</div>
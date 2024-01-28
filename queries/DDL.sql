
USE herero;

CREATE TABLE admin_tbl(
	adminID			int	PRIMARY KEY AUTO_INCREMENT,
	adminName		VARCHAR(20)	NOT NULL
);

CREATE TABLE user_tbl(
   userID			VARCHAR(20)	PRIMARY KEY,
   adminID			INT,
   passwd        	VARCHAR(20) NOT NULL,
   userName   		VARCHAR(20) NOT NULL,
   payOption     	CHAR(10) NOT NULL,
   mileage      	INT,
   userRate      	VARCHAR(20)	NOT NULL,
   blockYN     	CHAR(1) DEFAULT 'N',
   phoneNum			VARCHAR(20)	NOT NULL,
   totalPaid		INT,
   CONSTRAINT	fk_user_adminID	FOREIGN KEY	(adminID) REFERENCES	admin_tbl	(adminID)
);

CREATE TABLE userCarDetail_tbl(
	carNum		VARCHAR(20) PRIMARY KEY,
	userID		VARCHAR(20) NOT NULL,
	carType		VARCHAR(20) NOT NULL,
	compCarYN	CHAR(1) DEFAULT 'N',
	elecCarYN	CHAR(1) DEFAULT 'N',
	CONSTRAINT	fk_userCarDetail_userID		FOREIGN KEY	(userID)	REFERENCES user_tbl	(userID)
);

CREATE TABLE post_tbl(
	postID		INT AUTO_INCREMENT,
	userID		VARCHAR(20),
	title			VARCHAR(45) NOT NULL,
	postContent	VARCHAR(300) NOT NULL,
	postDate		DATE DEFAULT CURRENT_DATE,
	postDel		CHAR(1)  DEFAULT 'N'CHECK(postDel IN ('Y','N')),
	PRIMARY KEY (postID),
	CONSTRAINT fk_post_userID	FOREIGN KEY (userID) REFERENCES user_tbl (userID) 
);

CREATE TABLE comment_tbl(
	commentID	INT AUTO_INCREMENT,
	postID		INT,
	userID		VARCHAR(20),
	commentContent	VARCHAR(210),
	commentDate	DATE DEFAULT CURRENT_DATE(),
	commentDel    CHAR(1)  DEFAULT 'N' CHECK(commentDel IN ('Y','N')),
	PRIMARY KEY (commentID),
	CONSTRAINT fk_commnt_postID FOREIGN KEY (postID) REFERENCES post_tbl(postID) #별칭추가
);

-- 이밴트
CREATE TABLE eventinfo_tbl(
	eventID			INT			PRIMARY KEY
	,adminID		INT			NOT NULL 
	,eStartDate		DATE		NOT NULL 
	,eEndDate		DATE		NOT NULL 
	,eventName		VARCHAR(50)	NOT NULL
	,CONSTRAINT	fk_promo_adminID FOREIGN KEY (adminID) REFERENCES admin_tbl (adminID)
);

-- 프로모션
CREATE TABLE promo_tbl (
	promoID			VARCHAR(20)	PRIMARY KEY
	,pStartDate		DATE		NOT NULL
	,pEndDate		DATE		NOT NULL
	,discPrice		VARCHAR(10)	NOT NULL
	,eventID		INT			NOT NULL 
	,CONSTRAINT	fk_eventinfo_event_id FOREIGN KEY (eventID) REFERENCES eventinfo_tbl (eventID)
);

# parkingPrice_tbl
CREATE TABLE parkingPrice_tbl(
   parkPriceID     INT AUTO_INCREMENT,
   basePrice       INT DEFAULT 0,
   extraUnitPrice  INT DEFAULT 0,
   1dayPrice       INT DEFAULT 0,
   1monthPrice     INT DEFAULT 0,
   CONSTRAINT PRIMARY KEY (parkPriceID)
);

# charge_price_tbl
CREATE TABLE chargePrice_tbl(
	parkPriceID	INT,
	enterTime	TIME,
	exitTime	TIME,
	ticketType	VARCHAR(1),
	chargePrice	INT,
	CONSTRAINT PRIMARY KEY (parkPriceID),
	CONSTRAINT fk_chargePrice_parkPriceID FOREIGN KEY (parkPriceID) REFERENCES parkingPrice_tbl (parkPriceID)
);

# actualPaid_tbl
CREATE TABLE actualPaid_tbl(
	paidID 		INT PRIMARY KEY,
	parkPriceID INT,
	userID 		VARCHAR(20),
	payidYN   	VARCHAR(1) CHECK(payidYN IN ('N','Y')),
	mileageUsed INT,
	actualPaid 	INT,
	promoID 		VARCHAR(20),
	CONSTRAINT fk_actualPaid_parkPriceID FOREIGN KEY (parkPriceID) REFERENCES chargePrice_tbl (parkPriceID),
	CONSTRAINT fk_actualPaid_userID FOREIGN KEY (userID) REFERENCES user_tbl (userID),
	CONSTRAINT fk_actualPaid_promoID FOREIGN KEY (promoID) REFERENCES promo_tbl (promoID)
);

# parkTime_tbl
CREATE TABLE parkTime_tbl(
	parkTimeID      INT AUTO_INCREMENT,
	baseTime        INT,
	extraUnitTime	INT,
	CONSTRAINT PRIMARY KEY (parkTimeID)
);

# parkinglot_tbl
CREATE TABLE parkinglot_tbl(
	parkingID		VARCHAR(20),
	parkPriceID		INT,
	parkTimeID		INT,
	parkName		VARCHAR(100),
	parkTel			VARCHAR(15),
	parkCap			INT,
	elecChargeYN	CHAR(1) DEFAULT 'N' CHECK (elecChargeYN IN ('N','Y')),
	payMethod		VARCHAR(50) DEFAULT '현금, 카드, 계좌이체',
	CONSTRAINT PRIMARY KEY (parkingID),
	CONSTRAINT fk_parkinglot_parkPriceID FOREIGN KEY (parkPriceID) REFERENCES parkingPrice_tbl(parkPriceID),
	CONSTRAINT fk_parkinglot_parkTimeID FOREIGN KEY (parkTimeID) REFERENCES parkTime_tbl(parkTimeID)
);

#address_tbl
CREATE TABLE address_tbl(
	parkingID       VARCHAR(20),
	subAddr1		VARCHAR(30) DEFAULT '', # 광역시, 특별시, 도
	subAddr2		VARCHAR(20) DEFAULT '', # 시군구
	subAddr3		VARCHAR(20) DEFAULT '', # 읍면동리
	subAddr4		VARCHAR(20) DEFAULT '', # 지번
	CONSTRAINT fk_address_parkingID FOREIGN KEY (parkingID) REFERENCES parkinglot_tbl (parkingID)
);

# openingDays_tbl
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

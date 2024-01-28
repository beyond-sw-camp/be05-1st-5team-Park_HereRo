-- 회원
-- 테스트케이스X
INSERT INTO admin_tbl
VALUES (1, '홍길동')

-- 회원 테이블
-- 회원가입
INSERT INTO user_tbl (userID, adminID, userName, passwd, payOption, mileage, userRate, phoneNum, totalPaid)
VALUES ('hongkilgold', 1, '홍길금', 'gold1290', '카드', 0, 'Bronze', '010-1234-5678', 0);

-- 로그인
SELECT if(count(*)>=1, '로그인 성공', '회원정보를 다시 확인해주세요') `로그인 결과`
FROM user_tbl
WHERE userID = 'hongkilgold' AND passwd = 'gold1290';

-- 탈퇴 (세부정보테이블과 회원테이블에서 정보 둘다 삭제
DELETE
FROM userCarDetail_tbl
WHERE userID = (SELECT userID FROM user_tbl WHERE userName = '홍길금');

DELETE
FROM user_tbl
WHERE userID = 'hongkilgold';


-- 회원 상세테이블 
-- 차량 정보 등록
insert into userCarDetail_tbl 
values ('23바 6591', 
(select userID from user_tbl where userName = '홍길금'), '경차', 'Y', 'N') ;

-- 아이디와 이름으로 차량 정보 등록
insert into userCarDetail_tbl 
values ('19가 0991', 
(select userID from user_tbl where userID = 'hongkilgold' and passwd = 'gold1290'), '대형세단', 'N', 'N') ;

-- 차종 수정
update userCarDetail_tbl
set carType = '중형SUV'
where userID = (select userID from user_tbl where userID = 'hongkilgold' and passwd = 'gold1290' AND carNum = '19가 0991') ;

-- 차종 삭제
delete from userCarDetail_tbl
where userID = (select userID from user_tbl where userID = 'hongkilgold'
and passwd = 'gold1290' AND carNum = '19가 0991') ;

-- 관리자 테이블 
-- 회원 차단 : blockYN로 회원이 차단되었는지 알 수 있음
update user_tbl
set blockYN = 'Y'
where userID = 'hongkilgold' ;


-- 결제
-- 청구 금액 테이블 (들어온 시간, 나간 시간으로 청구 금액 계산) 
Insert INTO chargePrice_tbl ( parkPriceID, enterTime,  exitTime, ticketType, chargePrice)
VALUES ((SELECT parkPriceID
		  FROM parkingprice_tbl 
		  WHERE parkPriceID = 16) , '09:00:00', '18:00:00', null, 0);

UPDATE chargePrice_tbl
SET chargePrice = ( SELECT ((time_to_sec(c.exitTime) - time_to_sec(c.enterTime)  -  (t.baseTime * 60)) / (t.extraUnitTime*60))
                           * p.extraUnitPrice + p.basePrice AS 청구금액
                    FROM  parktime_tbl t
                    JOIN  parkinglot_tbl l ON (t.parkTimeID = l.parkTimeID)
                    JOIN parkingPrice_tbl  p ON( l.parkPriceID = p.parkPriceID)
                    JOIN chargeprice_tbl c ON(c.parkPriceID = p.parkPriceID)
                    WHERE l.parkName = '부천역 남부 제2호')
where parkPriceID = 16;

-- 1일권과 1달권의 경우 해당하는 금액을 청구
INSERT INTO chargePrice_tbl (parkPriceID, enterTime, exitTime, ticketType, chargePrice)
VALUES ( (SELECT parkPriceID 
	 FROM parkingprice_tbl
	   WHERE parkPriceID = 3)
    ,
    '09:00:00',
    '18:00:00',
    'd',
    (SELECT 1dayPrice
     FROM parkingPrice_tbl p
     JOIN chargePrice_tbl c ON c.parkPriceID = p.parkPriceID
     WHERE c.parkPriceID = 3)
);

-- 실제 결제 데이블
-- 테스트케이스X
INSERT INTO parkinglot_tbl
	VALUES (1, 2000, 3, 60, '우리주차장', 02-922-2222, 10, 'Y', 102120) ;
INSERT INTO parktime_tbl
	VALUES (11010, 30, 10) ;

-- 마일리지 사용 없이 결제하는 경우
insert into actualPaid_tbl (paidID, parkPriceId, userID, payidYN,mileageused,
actualPaid, promoID)
VALUES (1, 
(select parkPriceID
 from chargePrice_tbl
where parkPriceID = '3')
,(select userID
from user_tbl
where userName = 'ddd'),'Y',24,40000,NULL)

-- 마일리지 사용하며 결제하는 경우
insert into actualPaid_tbl (paidID, parkPriceId, userID, payidYN,mileageused,
actualPaid, promoID)
VALUES (2, 
(select parkPriceId
 from chargePrice_tbl
where parkPriceID = 3)
,(select userID
from user_tbl
where userName = '23'),'Y', 24,40000,NULL)

-- 할인을 받고 마일리지를 사용하는 경우 (불가)
-- 불가를 나타낼 수 없어 paidYN을 Y가 아닌 N으로 업데이트
insert into actualPaid_tbl (paidID, parkPriceId, userID, payidYN,mileageused,
actualPaid, promoID)
values (3, 
(select parkPriceId
 from chargePrice_tbl
where parkPriceID = 11)
,(select userID
from user_tbl
where userName = 's'),'Y', 111,40000,
(select promoID
from promo_tbl
where  promoID =  '?' ));

update actualPaid_tbl
set payidYN = 'N'
where paidID = (select paidID
								from actualPaid_tbl
								where payidYN = 'Y'
								and mileageused is not null
								and promoID is not null);

-- 결제 금액이 0인경우, 결제가 되었다고 처리					
insert into actualPaid_tbl (paidID, parkPriceId, userID, payidYN,mileageused,
actualPaid, promoID)
VALUES (13, 
(select parkPriceID
 from chargePrice_tbl
where parkPriceID = '3')
,(select userID
from user_tbl
where userName = 'asd'),'Y',24,40000,NULL) ;

-- 결제가 되지 않은 경우
insert into actualPaid_tbl (paidID, parkPriceId, userID, payidYN,mileageused,
actualPaid, promoID)
VALUES (21, 
(select parkPriceId
from chargePrice_tbl
where parkPriceID = 1234)
,(select userID
from user_tbl
where userID='encore'),'N' ,24, 30202,
(select promoID
from promo_tbl
where  promoID = 'dds'));

-- 게시판
-- 게시글 작성
INSERT INTO post_tbl (userID,title,postcontent,postDate,postDel)
VALUES ((SELECT userID
FROM user_tbl
WHERE userID = '사용자ID3')
,'이것은제목입3니다','이것은 내용입니다',DEFAULT, DEFAULT);

SELECT *
FROM post_tbl
WHERE title = '이것은제목입3니다';

-- 게시글 삭제
-- 작성자 아이디와 불일치 -> 삭제 오류
Delete
from post_tbl
where userId = (Select userId from user_tbl where userID= 11);

-- 작성자 아이디와 일치 -> update로 삭제 되었다는 표시인 postDel = 'y'로 수정
UPDATE post_tbl
SET postDel = 'Y'
WHERE userID = (SELECT userID FROM user_tbl WHERE userName = '사용자이름2');

-- 게시글 검색
SELECT *
FROM post_tbl
WHERE title = '이것은제목입3니다';

SELECT *
FROM post_tbl
WHERE title = '이것ㅋ은제목입3니다';

-- 내용 검색
SELECT *
FROM post_tbl
WHERE postContent = '집가고싶다';

SELECT *
FROM post_tbl
WHERE postContent = '집안가고싶다';

-- 삭제된 게시글 검색
SELECT *
FROM post_tbl
WHERE postDel = 'Y';

-- 댓글 작성
INSERT INTO post_tbl (userID,title,postcontent,postDate,postDel)
VALUES ((SELECT userID
FROM user_tbl
WHERE userID = '사용자ID4')
,'이것은제목입니다3','이것은 내용입니다',DEFAULT, 'Y');

select *
from post_tbl
where userID = '사용자ID4';

-- 댓글 삭제
-- id와 불일치 -> 삭제 오류
DELETE
FROM comment_tbl
WHERE userID = (SELECT userID FROM user_tbl WHERE userName ='사용자이름1');

-- id와 일치 -> update로 삭제 되었다고 표기 (commentDel = 'y')
UPDATE comment_tbl
SET commentDel = 'Y'
WHERE userID = (SELECT userID FROM user_tbl WHERE userName = '사용자이름1');

-- 삭제된 댓글 검색
select *
from comment_tbl
where commentDel = 'Y';

-- 주차장
-- 주차장 등록
insert into parkinglot_tbl values(000, 00, 00, '주차장', 
'010-1234-1234', 112, 'Y', '카드' );
select parkName
from parkinglot_tbl
where parkName = '주차장';

-- 운영기간 조회
-- 평일 시간 조회
select openingDays, wOpenTime, wdCloseTime
from openingDays_tbl
where parkingID = (select parkingID
										from parkinglot_tbl
										where parkName = '주차장');


-- 토요일 시간 조회							
select openingDays, satOpenTime, satCloseTime
from openingDays_tbl
where parkingID = (select parkingID
										from parkinglot_tbl
										where parkName = '주차장');
										
													select openingDays, hdOpenTime, hdCloseTime
from openingDays_tbl
where parkingID = (select parkingID
										from parkinglot_tbl
										where parkName = '주차장');

-- 공휴일 시간 조회
select openingDays, hdOpenTime, hdCloseTime
from openingDays_tbl
where parkingID = (select parkingID
										from parkinglot_tbl
										where parkName = '주차장');


-- 주차금액 확인
-- 입출차시간을 조회하여 기본 시간과 추가 단위 시간으로 나누고, 해당하는 금액에 맞게 계산
select baseTime, extraUnitTime
from parkTime_tbl
where parkTimeID = (select parkTimeID
										from parkinglot_tbl
										where parkName = '주차장');

select enterTime, exitTime, time(exitTime - enterTime) as diff
from chargePrice_tbl
where parkPriceID = (select parkPriceID
											from parkingPrice_tbl
											where parkPriceID = (select parkPriceID
																						from parkinglot_tbl
																						where parkName = '주차장'));

SELECT sec_to_time(time_to_sec(c.exitTime) - time_to_sec(c.enterTime)  -  (t.baseTime * 60)) AS 주차시간,
		((time_to_sec(c.exitTime) - time_to_sec(c.enterTime)  -  (t.baseTime * 60)) / (t.extraUnitTime*60)) * p.extraUnitPrice + p.basePrice AS 청구금액
FROM  parktime_tbl t
JOIN  parkinglot_tbl l ON (t.parkTimeID = l.parkTimeID)
JOIN parkingPrice_tbl  p ON( l.parkPriceID = p.parkPriceID)
JOIN chargeprice_tbl c ON(c.parkPriceID = p.parkPriceID)
WHERE l.parkName = '주차장';

-- 기본 시간 내 출차의 경우 가격 확인
select baseTime
from parkTime_tbl
where parkTimeID = (select parkTimeID
										from parkinglot_tbl
										where parkName = '주차장');

select parkPriceID
from parkingPrice_tbl
where parkPriceID = (select parkPriceID
											from parkinglot_tbl
											where parkName = '주차장');

-- 1일권/1달권 금액 확인											
select 1dayPrice, 1monthPrice
from parkPriceID
where parkPriceID = (select parkPriceID
											from parkinglot_tbl
											where parkName = '주차장');
											
											
-- 주차장 주소 검색
select concat(subAddr1, subAddr2, subAddr3, subAddr3) as address
from address_tbl
where parkingID = (select parkingID
										from parkinglot_tbl
										where parkName = '주차장');																						

-- 주차장 주소로 주차장 ID, 이름 검색
select p.parkingID, p.parkingName
from parkinglot_tbl p
join address_tbl  a on(p.parkingID = a.parkingID)
where a.subAddr1 like '서울%'
and a.subAddr2 LIKE '강남%';	

-- 전기차 충전기 유무 검색 
-- 전기차 충전기가 있는 곳 검색
select *
from parkinglot_tbl
where elecChargeYN ='Y';			

-- 원하는 주소(특정 지역)에 전기차 충전기가 있는 곳 검색
select *
from parkinglot_tbl
where elecChargeYN = 'Y'
and parkingID = (select parkingID
									from address_tbl
									where subAddr1 = '서울');	

-- 이벤트 생성								
insert into eventinfo_tbl
values (1, 1, '2020-01-01', sysdate(), 'open');

select *
from eventinfo_tbl
where eventName = 'open';		

-- 진행중인 이벤트 조회
select *
from eventinfo_tbl
where eStartDate <= sysdate() 
and sysdate() <= eEndDate


-- 프로모션 생성
insert into promo_tbl
values('sdfsdf', '2020-01-01', 
				'2099-12-31',' 100', 
(select eventID from eventinfo_tbl where eventName = 'open'));

-- 이벤트 이름을 통한 할인 가격 조회
select discPrice
from promo_tbl
where eventID = (select eventID
									from eventinfo_tbl
									where eventName = 'open');
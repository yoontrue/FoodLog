--MYSQL DB 환경설정
--user : yoonjin
--pwd : 12345
--db명 : testdb
--ver : 8.0.23

--db생성 : create database testdb;
--유저생성 : create user ‘yoonjin’@‘localhost' identified by '12345';
--권한부여 : grant all privileges on *.* to 'yoonjin'@'localhost';
--변경사항반영 : flush privileges;

DROP TABLE FOOD_LOG;
CREATE TABLE FOOD_LOG(
NO int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
FNAME VARCHAR(20),
STORE VARCHAR(20),
PRICE VARCHAR(6),
STAR VARCHAR(1),
DATE VARCHAR(8),
TYPE VARCHAR(10),
COMMENT VARCHAR(250),
PICTURE VARCHAR(50)
);

INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('월남쌈','베트남월남쌈','24000','5','20180112','동남아','야채가 많아서 좋았다.','food01.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('디저트','디저트10','18000','4','20180530','디저트','너무 달긴했는데 먹을만 했다.','food02.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('간장 스테이크','스테키','32000','3','20180809','양식','비싸고 별로다. 입맛만 버렸어..','food03.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('피자','피핏자','9000','4','20181011','양식','짭짜롬하니 맛있었다!','food04.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('도시락소풍','각자 집에서','12000','5','20181231','홈쿡','날씨도 좋았고 다들 오랜만에 만나서 너무 좋았다','food05.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('기본김밥','너네집김밥','3800','4','20190104','한식','김밥 왜이렇게 비싸졌을까...','food06.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('일본라멘','라멘멘집','7000','5','20190228','일식','라멘 맛있더... 더 너무 배부르게 잘먹었다.','food07.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('양식집','파스타 좀 하는 집','32800','1','20190503','양식','인성 좀 하는집 같다 1점 너무 4가지가 없다. 다시는 안감','food08.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('포장마차','마차달려','28000','5','20190720','한식','역시 소주는 포장마차에서 먹어야지 소맥은 진리다.','food09.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('일산시장','맛나전집','6000','4','20190920','한식','엄마가 해줬던 전이 생각났다 엄마집 놀러가야지','food10.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('떡볶이','덕복기','8000','5','20191022','분식','떡볶이? 말 다했지 뭐 ','food11.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('간장게장','엄마집','0','5','20191101','한식','밥 비벼먹음녀 밥도둑 개꿀맛','food12.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('삼겹살','너희살로삼겹살','35000','4','20200630','한식','이름 웃겨서 들어갔는데 사장님도 친절하시고 너무 좋았다.','food13.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('디저트','딸기집','17000','3','20200712','디저트','친구네 어머니가 디저트집 차리신건데 가격이나 맛이나 절교할뻔','food14.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('딸기코코','코코집','4200','2','20200713','음료','생긴건 멀쩡해서 맛은 왜저럴까','food15.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('석류톡톡','주시','3000','4','20210115','음료','너무 시다 다음엔 그냥 딸바 먹어야지','food16.jpg');
INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES('중식당','기억안남','9900','3','20210201','중식','음 나랑 안 맞았다. 다시는 보지말자! 아디오스!','food16.jpg');


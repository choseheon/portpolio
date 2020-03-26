# MangoCRM

#### 개발환경 - Windows10
#### 사용도구 - Eclipse, Sql Developer, MyBatis, drawio, kakao oven, Trello, Google spreadshhet
#### 사용기술 - Java, Jsp, Spring3.0, Oracle 11g, JS, Ajax, jQuery, XML



## CRM 이란?
#### Customer Relationship Management의 약자로 우리말로는 ‘고객관계관리’ 라고 합니다.

#### * 기업이 고객과 관련된 내 외부 자료를 분석, 통합해 고객 중심 자원을 극대화하고 이를 토대로 고객특성에 맞게 마케팅 활동을 계획, 지원, 평가하는 과정입니다.
#### * 같은 사이클을 통하여 고객을 적극적으로 관리하고 유도합니다.

#### * CRM은 고객의 정보, 즉 데이터베이스를 기초로 고객을 세부적으로 분류하여 효과적이고 효율적인 마케팅 전략을 개발하는 경영전반에 걸친 관리 체계이며, 이를 정보기술이 밑받침돼 구성됩니다.

## 구현화면
![캠페인목록](https://user-images.githubusercontent.com/61402001/77621787-77862b00-6f80-11ea-91e2-b4325077b0b7.png)
![sumulater](https://user-images.githubusercontent.com/61402001/77621790-78b75800-6f80-11ea-9b73-bb93be248831.png)

## kakao oven design
![오븐4](https://user-images.githubusercontent.com/61402001/77621748-62110100-6f80-11ea-8eff-12acaef98326.png)
![오븐1](https://user-images.githubusercontent.com/61402001/77621749-62a99780-6f80-11ea-84c1-ebc6a5e4af47.png)

## 메타 관리
#### * 구글 스프레드 시트를 통한 메타데이터 관리를 통해 개발에 필요한 공통 사전 제작 및 활용
![메타데이터](https://user-images.githubusercontent.com/61402001/77621743-60dfd400-6f80-11ea-8a8b-cc4ee1afb823.png)

## DB모델링 / ERD ( 부분 모듈화 ) - draw.io
#### * 부분 모듈화된 DB설계를 통하여 확장성 확보
#### * 공통 코드 사용을 통해 데이터 사이즈 축소
![erd](https://user-images.githubusercontent.com/61402001/77621824-879e0a80-6f80-11ea-906e-debe5fa2edf1.png)

## 테이블 정의서
#### *모델링 데이터를 기준으로 테이블 정의서 작성
![테이블정의서](https://user-images.githubusercontent.com/61402001/77621828-88cf3780-6f80-11ea-9782-5695e9c8b8ce.JPG)

## FrameWork 설계
### [ Spring 3.0 ]
#### * Annotaion Driven을 통한 컨트롤러 호출
#### * Resource Mapping을 통한 리소스 폴더 관리

### [ MyBatis ]
#### * MyBatis와 Oracle 연동 구현
#### * Connection Pool 셋팅을 통한 DB 연결 최적화

### [ Log4j ]
#### * 패키지별 로그 레벨 설정을 하여 디버깅 효율성 향상

### [ Maven ]
#### * 라이브러리 관리를 위해 사용


## 나의 개발영역
#### * 모든 페이지의 기획, 메타관리, 테이블 정의를 참여하였음.
#### * [캠페인 목록], [캠페인 업체선정], [결재 목록], [시뮬레이션 목록], [성과 분석], [채팅 목록], [채팅 초대], [채팅방] 페이지 개발 및 디버깅

### 1. [ Ajax를 활용한 동적Web 구현 ]
#### * 코드사진과 같이 ajax를 이용하여 구현
#### * 웹페이지의 속도향상을 위해 사용
#### * 서버의 처리 완료를 기다리지 않고 처리가 가능함
#### * 페이지 내 사용자의 이용에 따라, 다양한 UI를 구현하기 위해 사용
#### * 특히 [사내 채팅방, 캠페인 목록] 구현에 잦고, 많은 데이터 흐름이 예상되어 사용하였음.
![채팅목록](https://user-images.githubusercontent.com/61402001/77622043-ec596500-6f80-11ea-8930-33b946a88f50.png)
![채팅방구현](https://user-images.githubusercontent.com/61402001/77624190-c46c0080-6f84-11ea-9c62-e0ed48909115.JPG)
![ajax캡처](https://user-images.githubusercontent.com/61402001/77622059-f11e1900-6f80-11ea-9ecf-6db63b0f275e.JPG)

### 2. [ HighChart를 활용한 Chart기능 제공 ]
#### * 사진과 같이 HighChart를 활용하여 동적으로 차트를 드로잉
#### * [시뮬레이션], [성과분석] 페이지에 반응 량, 수신 량 등을 보기 쉽게 그래프를 통해 구현함
![sumulater](https://user-images.githubusercontent.com/61402001/77622082-fb401780-6f80-11ea-9952-80d0905f1a2b.png)
![chart](https://user-images.githubusercontent.com/61402001/77622103-0430e900-6f81-11ea-8184-0701f8587b23.JPG)

### 3. [ SVN을 통한 공동작업 ]
#### * SVN을 활용하여 팀 작업을 진행
#### * 파트  별 개발을 통한 개발일정 단축
#### * 사진10과 같이 SVN을 이용하여 공동작업을 하였음

![svn](https://user-images.githubusercontent.com/61402001/77622129-0f841480-6f81-11ea-874c-9175e7f42ff6.JPG)
![공통팝업](https://user-images.githubusercontent.com/61402001/77622135-10b54180-6f81-11ea-92f0-7b0030e4960d.JPG)

### 4. [ 코어 태그를 통한 팝업의 공통화 ]
#### * 사진과 같이 여러 페이지에서 공통적으로 쓰이게 되는 팝업을 표준화 해 <c:import> 만 하면 기본 틀에서 벗어나지 않은 다양한 형태로 바꿔 사용 할 수 있게 만들었습니다.
![부서선택1](https://user-images.githubusercontent.com/61402001/77622159-190d7c80-6f81-11ea-8fb5-d69c11a3890d.JPG)
![부서선택2](https://user-images.githubusercontent.com/61402001/77622156-17dc4f80-6f81-11ea-9e5d-ab73bcf10191.JPG)
![ajax1](https://user-images.githubusercontent.com/61402001/77622180-2165b780-6f81-11ea-8be2-24d9419089c7.JPG)

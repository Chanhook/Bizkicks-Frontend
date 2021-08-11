

# Frontend Project

비즈킥스는 Getx를 사용하여 생성한 flutter 프로젝트 입니다. 비즈킥스는 모바일을 지원합니다.  

## 시작하기 

**Step 1:**
다운로드 또는 이 레포지토리를 아래 링크를 통해 클론을 하세요:
```
https://git.swmgit.org/swm-12/12_swm32/bizkicks-frontend.git
```

**Step 2:**

프로젝트 루트로 이동하고 콘솔에서 다음 명령을 실행하여 필요한 종속성을 가져옵니다.

```
flutter pub get 
```




## 비즈킥스 Features:

* Controllers
* Model
* Screen
* Services
* Urls
* GetX (State Management)
* Google Fonts
* Flutter Svg
* Http
* Naver Map
### 사용된 라이브러리 & 툴

* [Cupertino_icons](https://pub.dev/packages/cupertino_icons)
* [Naver_map_plugin](https://pub.dev/packages/naver_map_plugin)
* [GetX](https://pub.dev/packages/get) (State Management)
* [Http](https://pub.dev/packages/http)
* [Flutter Svg](https://pub.dev/packages/flutter_svg)
* [Google Fonts](https://pub.dev/packages/google_fonts)

### 폴더 구조
핵심 폴더 구조입니다.
```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

이 프로젝트에서 사용한 폴더 구조입니다.

```
lib/
|- controller/
|- model/
|- screen/
|- services/
|- urls/
|- widgets/
|- main.dart
```

어플리케이션의 메인 코드가 있는 lib 폴더로 들어가겠습니다.
```
1- controller - 상태관리를 위한 모든 controller들을 포함합니다.
2- model - 모든 어플리케이션 상수는 해당 파일의 이 디렉토리에 정의됩니다.
3- screen - 어플리케이션위에 보여질 화면들을 포함합니다.
4- services - 서버로 부터 api를 받아오기 위한 코드들을 포함합니다.
5- urls - 서버와 통신할 api 주소들을 포함합니다.
6- widgets - 응용 프로그램에 대한 공통 위젯을 포함합니다. 예를 들어, 버튼, 텍스트 필드 등
7- main.dart - 이것이 응용 프로그램의 시작점입니다. 모든 응용 프로그램 수준 구성이 이 파일에 정의되어 있습니다.
```



# 5. 💻동작 구현

1. 관리자 로그인(전용 아이디를 줬다고 가정, 결제등록함)
   1. 정액제 종량제 모델 설명
   2. 종량제 : 이용한 만큼만 냄. 특정 시간 정해두고 근접하면 알람(추천)
   3. 정액제 : 킥보드 브랜드, 이용시간 (단위 : 시 , 자유롭게)정해서 골라담기 (한달단위 개별계약, 할인, 10시간을 사면 못타도 그만큼 결제, 각각 시간당 가격 * 각 브랜드 탄 시간 후불정산) 5. 킥보드 목록이 보임. 2. 괜찮은 것들을 필터/정렬 기능(서비스 지역, 가격대, 헬멧 서비스, 보험)을 통해 '관심목록'(=장바구니)에 담음.(뺄 수도 있음) 로그아웃해도 관심목록은 유지된다. 3. '관심목록'에 담은 킥보드 회사들을 적당히 찾아보고(킥보드 회사들의 정보를 봄), 진짜 계약할 것들을 고름. 4. 고른 후에 계약할 킥보드 회사들만 체크한 후 계약 버튼을 누름.
   4. 대시보드에 들어가서 모델 타입, 사람별 이용량, 총 이용량, 등등 통계를 확인할 수 있음
      1. 통계 여러 개 만들어 두고, 웹에 띄우고 앱으로 볼 수도 잇게 함(통계는 웹으로 보는 것이 더 적합할 것이기 떄문)
   5. 계약 취소 기능 - 현재 계약한 킥보드 회사 목록(남은 계약 일수, 잔여시간 등등)을 볼 수 있고, 계약 취소 버튼을 눌러 현재 계약중인 킥보드 회사와 계약을 끊을 수 있다.
2. 계약함(계약했다 치자, 계약 갱신 단위는 1달.)
   1. 회사별 입력 코드를 관리자에게 주고, 자기 팀원들에게만 해당 코드를 뿌린다.(이 방법은 보안 문제가 있을 수 있으므로 추후 수정)
3. 일반 사용자
   1. 받은 코드를 입력해서 회원가입(했다 치자) 개인인증은 SMS로 하자
   2. 회원가입 이후 운전면허 등록 창 띄워준다. 현재는 빠른 구현을 위해 i)의 안을 따르며, DB 설계는 확장을 위해 ii)의 안을 고려해 설계한다.
      1. '운전면허 등록'을 할 수 있다. 운전면허 등록을 하지 않으면 메인화면을 갈 수 없다.
      2. '운전면허 등록', '다음에 등록하기'를 선택할 수 있다. '다음에 등록하기'를 선택한 경우 킥보드 이용하기를 누르면 운전면허 입력 창으로 넘어간다.
   3. 메인화면에서 현 위치를 중심으로 회사가 계약한 킥보드 목록을 볼 수 있다.
      1. 킥보드 마커를 클릭하면 회사종류, 모델명, 배터리 상태 정보, 이전 사용자가 찍은 사진이 나타나고 찍은 사진은 확대할 수 있다.
      2. 해당 위치에 킥보드가 없는 경우에는 '킥보드가 없어요'버튼을 클릭할 수 있다.
      3. 이용하기 버튼을 누르면 QR 사진을 찍으면 킥보드 락이 해제되고 해당 킥보드를 이용할 수 있다.
         1. 킥보드 이용 중에는 현재 위치, 반납하기 버튼만 띄워준다.
         2. 만약 이용 중에 킥보드 고장/방전 등의 문제가 발생한 경우에는 리포트 버튼을 누를 수 있다.
         3. 이용 종료 버튼을 누르면 킥보드를 반납 및 '킥보드 주차 사진'을 찍어 앱에 올려야만 한다.
   4. 메인화면에서 검색 버튼을 누르면 장소/주소 검색 기능에서 위치를 검색하고, 그 위치를 즐겨찾기 추가를 할 수 있다. 최근위치, 즐겨찾기, 각각 삭제 기능이 있다.
   5. 메인화면에서 메뉴 버튼을 누르면 간단한 개인정보(소속, 이름 정도?), 메뉴 버튼이 슬라이드로 나온다. 이용내역, 안전교육, 로그아웃, 설정 탭이 있다.
      1. 이용내역 탭을 클릭하면 요약 탭, 이용내역 탭이 출력된다. 요약 탭은 본인이 이용한 시간이 보이고, 이용 내역 탭은 최근 이용 기록이 출력된다.
      2. 안전교육 탭을 클릭하면 킥보드 안전 이용교육 링크로 이동한다.
      3. 로그아웃 탭 누르면 홈 화면으로 간다.
      4. 설정 탭으로 가면 회원정보 수정, 알림 목록/푸시알림 허용, 앱 정보, 버전 등이 보인다.

# 6. 👀실행 화면

<이용자 화면> 

![스플래시](/uploads/7283b5b2e05bbffe4003bce592f2634d/스플래시.png)
![로그인](/uploads/139ab32a030971a9fb0063acebbadef3/로그인.png)


![아이디찾기-1](/uploads/13dfa86e87488a6c8202db72dfa92166/아이디찾기-1.png)

![비밀번호찾기](/uploads/f6bdce1c07e307e32419ef1572f417fe/비밀번호찾기.png)

![회원가입-계정설정하기](/uploads/883797424f871bf5b918a6f5a9bc5df4/회원가입-계정설정하기.png)

![회원가입-휴대폰번호인증](/uploads/35696f05d759ea9081659711d4e67ef7/회원가입-휴대폰번호인증.png)

![회원가입-계정설정하기-1](/uploads/2a987d84a4381c3d9a19e955010468f9/회원가입-계정설정하기-1.png)

![회원가입-회사코드입력하기](/uploads/ab2bea4fc27c411e53eff645ce34805e/회원가입-회사코드입력하기.png)

![회원가입-운전면허증등록하기](/uploads/6316cd40e649b52f0ede3df4afe9fa40/회원가입-운전면허증등록하기.png)

![회원가입완료](/uploads/2501fe0b91264403eeb08b17f5c32ee1/회원가입완료.png)

킥보드 이용 화면

![킥보드_맵](/uploads/cd8ed5c41fd2d5de79fd48e10a4455cc/킥보드_맵.png)

![킥보드_이용중](/uploads/a3c94b1e5f7f1f2402b5f9e37a391afd/킥보드_이용중.png)

![반납_완료하기](/uploads/d1f6df503f928d2768182d573d472a87/반납_완료하기.png)

관리자 화면

![X_-_54](/uploads/caef92a04711624b3e62c700016859fe/X_-_54.png)

![X_-_57](/uploads/da67df768da3298d3582872b147cf3d5/X_-_57.png)

![X_-_58](/uploads/d74e18ae9c385c5c50cb188dc111ebdf/X_-_58.png)

![X_-_59](/uploads/47428d218359207ef2b0156c5c3d2e53/X_-_59.png)

![X_-_60](/uploads/368312ea9fe93121ed25d41986d06f18/X_-_60.png)

![X_-_61](/uploads/e4d7c9161a79e696219b73d7f67c967f/X_-_61.png)

![X_-_62](/uploads/fc11273107d6d4801c40829f74cdf0e3/X_-_62.png)

![X_-_63](/uploads/bb280bff6e342f3460a9a4a3dfafe5ba/X_-_63.png)

![X_-_64](/uploads/151ba394c2e71accfaf2425be6737be6/X_-_64.png)

![X_-_66](/uploads/29da05d66227534fac6217aeea301f02/X_-_66.png)

![X_-_67](/uploads/2b198b02f53d2ee2516def99870be77b/X_-_67.png)

![X_-_68](/uploads/e4e46f8f17de1f471c90c902def07b10/X_-_68.png)

![X_-_69](/uploads/e7e19f9a294887e4458e6fbc2fbd543c/X_-_69.png)

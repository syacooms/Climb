Variable
====================================

	Java Script != Java		-> NodeJS , Vue, reAct, angler
	Client 코드. front end
	목적 : 웹브라우저의 Tag를 접근하기 위한 스크립트.
		보조 프로그래밍적인 요소이다.
		화면을 제어하기 위한 요소이다.
		컴파일을 하지 않는다. -> 가볍다
	Java Script 경량화 -> JQuery
	
	예) 회원가입 -> 빈칸을 조사. ID글자수를 조사. PW에 숫자포함 체크
	
	CSS에 대해서 제어, 구현.
	Timer를 설정해서 특수 효과처리가 가능하다.
	
	접근하기 위한 속성(Attribute)
	id	-> 1개		JS
	class -> 다수		JS
	name -> 다수		JS
	
	      주의점 : Java Script <- Server OK
		   Java Script -> Server NO      ===> Node JS
		   JQuery(Ajax) <- Server OK
      -->
---------------------------------------
* 기본 자료형을 전부 담을 수 있다.
* variable의 경우 어느 위치에서나 선언해도 사용이 가능하다. <-문제점
* 기본적인 문법들은 자바와 비슷하다.


      var -- int, double, String, Object, char, class
 	    let
      var num = 123;
 	    var pi = 3.141592;
 	    var name = '홍길동';
  	  var answer = true;
      // Array
	    let cars = [ "Saab", "Volvo", "BMW" ];
	    console.log( cars[1] );
	
	    // int Arr[] = new int[3];
	    cars = new Array(3);
  	  cars[0] = '사브';
	    cars[1] = '볼보';
	    cars[2] = '비엠';
	    console.log( cars[0] );
	
	    for(i = 0; i < cars.length; i++){
		    console.log( cars[0] );
	    }
	
	    for(i in cars){
		    console.log( cars[i] );
	    }
    
  
  

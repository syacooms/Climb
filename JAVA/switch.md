switch (조건문)
============================================

		 	
		 	switch( 변수 ){
		 		case 변수값1:
		 			처리
		 			break; 탈출
		 		case 변수값2:
		 			처리2
		 			break;
		 		default:	else
		 			break;	
		 	}
------------------------------------------- 
1.1-1 switch문
-------------------------------------------
* if문과 달리 switch문은 단 하나의 조건식으로 많은 경우의 수를 처리할 수 있고, 표현도 간결하므로 알아보기 쉽다.
  그래서 처리할  경우의 수가 많은 경우에는 if문보다 swich문으로 작성하는 것이 좋다.
		 
		
		int number =1;
		
		switch( number ) {
			case 1:
				System.out.println("number = 1");
				break;
			case 2:
				System.out.println("number = 2");
				break;
			default:	// 생략이 가능
				System.out.println("number != 1 and number !=2");
				break;
		}
		
		// > < >= <- !
		char c = '가';
		switch( c ) {
			case '가':
			System.out.println("c = 가");
			break;
			
		}
		
		 double d = 123.1;
		swich( d ) {
			case 123.1;
				break;
		}
		 
		
		String str = "ABC";
		switch( str ) {
			case "ABC":
				System.out.println("str = " + str);
				break;			
		}
-------------------------------------------
1.1-2 switch문의 제약 조건
------------------------------------------- 
* switch 문의 조건식은 결과값이 반드시 정수이어야 하며, 이 값과 일치하는 case문으로 이동하기 때문에
  case문의 값 역시 정수이어야 한다. 그리고 중복되지 않아야 한다. 같은 값의 case문이 여러 개이면, 어리도 이동해야할 지 알 수 없기 때문이다.
		
		 switch( number) {
			case Number > 1
			
			case에 연산자가 대입 되지 않는다.
			
		}
		
		
------------------------------------------- 
1.1-3 실제로 쓰이는 형식의 예제
------------------------------------------- 
	
		- 실제 실무에서 쓰는 형식
		
		char c = '+';
		
		switch( c ){
			case '+':
		
			break;
		
	}

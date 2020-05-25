if(조건문)
========================================
		 		
		 		if
		 			if
		 			else
		 			else if
		 			
		 			논리 연산자: &&(AND), ||(OR) !(NOT)
		 			범위: 		 > < >= <= == !=  
		 			
----------------------------------------		 			
1.1 if
----------------------------------------
* 만일(if) 조건식이 참(true)이면 코드블럭({})안의 문장들을 수행한다.

		 	
		 	형식 :
		 		  조건( 조건성립 공식(true/false) ){
		 		  	  처리
		 		  } 
		 		  
		 		  if( number > 0){
		 		  	  처리
		 		  }
		 		  
		 		  if( nnumber > 0 && number <= 10 && number != 5){
		 		      처리
          }
          
----------------------------------------
1.1-1 if - else 
----------------------------------------
* 조건식의 결과가 참이 아닐 때, 즉 거짓일 때 'else' 블럭의 문장을 수행한다.
		 		 
		 		 
		 		 if( number < 5 ){
		 		 	 처리1
		 	 	 }
		 	 	 if( number > 10 ){
		 	 	 	 처리1
		 	 	 }
		 	 	 if( number < 5 || number > 10 ){
		 	 	 
		 	 	 }
		 	 	 
		 	 	 if( 조건 1){ 조건 1 == true
		 	 	 	 처리
		 	     }
		 	     else{		  조건 1 == false
		 		     처리2
		 		 }	
         
----------------------------------------         
1.1-3 if - else if 
----------------------------------------
* 결과가 참인 조건식을 만날 때까지 첫 번째 조건부터 순서대로 평가한다.
  참인 조건식을 만나면, 해당 블럭{}의 문장들을 수행한다. 
  
		 		 조건 분기 n개만큼의 조건
		 		 if( 조건1 ){
		 		 	 처리1
		 		 }
		 		 else if( 조건2 ){
		 		 	  처리2
		 		 }
		 		 else if( 조건3 ){
		 		 	  처리3
		 		 }
		 		 else( 조건1 = 조건2 = 조건3 = false
		 		 
		 		 }
		 		 
---------------------------------------		 		 
1.2 if의 다양한 예제
----------------------------------------

	
		//조건분기 연산자 예제
		int number = 6;
		if(number > 5) {
			System.out.println("number는 5보다 크다");
			
		}
		
		if(number >= 6) {
			System.out.println("number는 6보다 크거나 같다");
		}
		
		if(number == 6) {
			System.out.println("number는 6이다.");
		}
		
		if(number != 5) {
			System.out.println("number는 5가 아니다");
		}
		
		if(number > 0 && number < 10) {
			System.out.println("number는 0부터 9사이의 수");
		}
		
		if(number < 5 || number > 10) {
			System.out.println("number는 5보다 작거나 10보다 크다");
		}
		
		if(number > 10) {
			System.out.println("number는 10보다 크다");
		}
		else {	// number <= 10
			System.out.println("number는 10보다 작거나 같습니다");
		}
			
		
		// 삼항 연산자 예제
		number = 85;
		
		if(number == 100) {
			System.out.println("100점입니다.");
		}
		else if(number >= 90 && number < 100) {
			System.out.println("90점이상입니다");			
		}
		else if(number >= 80 && number < 90) {
			System.out.println("80점이상입니다");
		}
		else {
			System.out.println("80점미만입니다");
		}
		
		
		// 조건문 안에 조건문
		number=86;
		if(number >= 80 && number < 90) {
			if(number >= 85) {
				System.out.println("합격입니다");
			}
			else {
				System.out.println("불합격입니다");
			}
		}
		
		if(number >= 85 && number < 90) {
			
		}
		if(number >= 80 && number < 85) {
			
		}
		
		boolean b;
		b= false;
		
		if(b == false) {
			System.out.println("b == false입니다");
		}
		
		if( !b ) {
			System.out.println("b == false입니다");
		}
		if( b ) {
			System.out.println("b == true입니다");
		}
		if(true) {
			// 무조건 실행
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

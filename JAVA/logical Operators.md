논리 연산자 (true/false)
===========================
		 
		 	&& AND 그리고
		 	|| OR 또는
		 	!  NOT ~아닌
		 	
		 	제어문과 같이 사용한다(if, while, do while)
		 	< > <= >= == !=
----------------------------		 		
1.1 &&(AND결합)
----------------------------
* 피연산자 양쪽 모두 true 이어야 true를 결과로 얻는다.
 
		 	AND 0 0 -> 0
		 	    0 1 -> 0
		 	    1 0 -> 0
		 	    1 1 -> 1
          
		
		
----------------------------
1.1-1 ||(OR결합)
----------------------------
* 피연산자 중 어느 한쪽이 true이면 true를 결과로 얻는다.
  
		 	OR  0 0 -> 0
		 	    0 1 -> 1
		 	    1 0 -> 1
		 	    1 1 -> 1
          
		int number = 0; 
		System.out.println(number > 0 || number < 10);
----------------------------
1.1-2 ! (논리부정연산자 NOT결합)
----------------------------
*이 연산자는 피연산자가 true이면 false를, false면 true를 결과로 반환한다.
 간단히 말해서 true와 false를 반대로 바꾸는 것이다.
		
	 	NOT 0 -> 1 1-> 0
		
		number = 5;
		System.out.println(number == 5);
		System.out.println(number != 5);
		
		System.out.println(! (number > 5 && number < 10) );
		System.out.println(! (number < 5) );
		//number >= 5
-----------------------------	
2.1 삼항연산자 (또는 조건연산자)
-----------------------------
*조건 연산자는 조건식, 식1, 식2 모두 세 개의 피연산자를 필요로 하는 삼항 연산자이며,
 삼항 연산자는 조건 연산자 하나뿐이다.
		
		
    조건에 따라서 값을 대입
		value = ( 조건 ) ? '값1' : '값2' ;
		조건이 참이면 앞에 거짓이면 뒤
		 	
		 
		char c;
		c = (number > 0)?'Y':'N';
		System.out.println("c = " + c);
		
		int n;
		n = (number < 5)?10:20;
		System.out.println("n = " + n);
		
		String str;
		str = (number > 3)?"3보다크다":"3보다작다";
		System.out.println(str);
    

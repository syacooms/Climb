for(반복문)
=====================================
		 	loop문,순환문
		 	
		 	지정한 횟수만큼 반복을 하는 제어문
		 	
		 	for, while , do while
		 	
		 	for ( 초기화 ; 조건 ; 연산식; ){
		 	
		 		//	처리
		 	
		 	}
------------------------------------
1.1-1 for문
------------------------------------
*for문과 while문은 구조와 기능이 유사하여 어느 경우에나 서로 변환이 가능하며, 반복 횟수를 알고 있을 때는 for문을,
 ㄱ렇지 않을 때는 while문을 사용한다.
		 	
		 	
		 	int num = 0;
		 	num = num + 1;
		 	num++
		 	
		 	for( 초기화(1) ; 조건문(4)(7)(10) ; 연산식(3)(6)(9) ) {
		 	
		 		처리(2)(5)(8)
		 	
		 	}
		 	
		 	(11)탈출 !!
		 
		int i;
		
		for(i=0; i<10; i++) {
			System.out.println("i = " + i );
			
		}
		
		System.out.println("loop out i = " + i );
		
		int number = 0;
		number = number + 1;
		number = number + 2;
		number = number + 3;
		number = number + 4;
		number = number + 5;
		number = number + 6;
		number = number + 7;
		number = number + 8;
		number = number + 9;
		number = number + 10;
		
		System.out.println("number = " + number);

		/*
		int j;
		int num = 0;
		
		for(j = 1; j<=10; j++) {
			num = num + j;
			
		}
		System.out.println("number = " + number);
		
    
		for (int i = 10; i > 0; i--) {
			System.out.println("i = " + i);
			
		}
		*/
		for(int i = 0; i < 10; i =  i + 2) {
			System.out.println("i = " + i);
		}
		
		int count = 0;
		
		for ( ; count < 10 ; ) {
			System.out.println("count = " + count);
			count++;
		}
		
		/*
    
    //복수의 증감식도 사용가능하다.
		for (int i = 0; j =0; i < 10; i++,j++) {
				System.out.println("i = " + i);
				System.out.println("j = " + j);
		}
		*/

------------------------------------
1.1-2 중첩 for문 (예제 : 구구단)
------------------------------------
*for문 안에 또 다른 for문을 포함시키는 것이 가능하며, 중첩 for문이라고 한다. 중첩 횟수는 거의 제한이 없다,

		//for안에 for
		
		// 구구단 2단의 모든 합을 구하라.
		
		int sum = 0;
		for(int i=3; i <=30; i= i + 3) {
			System.out.println("i = "+ i);
			
			
		}
		System.out.println("합:" + sum);
		
		sum=0;
		int num2 = 3;
		for (int i = 0; i < 10; i++) {
			sum = sum + num2;
			num2 = num2 + 3;
			
		}
		System.out.println("합:" + sum);
		
		
		for (int i = 0; i < 10; i++) { //loop 10
			
			System.out.println("i = " + i);
			
			for (int j = 0; j < 5; j++) { //loop 5
				
				System.out.println("\t j =] " + j);
				
			}
		}
		
		 


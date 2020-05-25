while , do-while
==================================
		 	
		 	
		 	while		(순환문)
		 	do while
		 	
		 	형식 :  
		 			변수선언
		 			변수 초기화
		 			
		 			while( 조건 ){
		 				처리
		 				변수 연산
		 				
		 			}
		 			
		 			변수선언
		 			변수 초기화
		 			do{
		 				처리
		 				연산식
		 				
		 			
		 			}while( 조건 );
		 	
-----------------------------	
1.1-1 while
-----------------------------
* for문에 비해 while문은 구조가 간단핟, if문처럼 조건식과 블럭{}만으로 이루어져 있다.
  다만 if문과 달리 while문은 조건식이 '참(true)인 동안'. 즉 조건식이 거짓이 될 때까지 블럭{}내의 문장을 반복한다.
		 			
		 			
		 			for ( 변수 초기화 ; 조건 ; 연산식) {
		 					  처리
		 			}
		
		 
		
		int w;
		
		w = 0;
		while( w < 10) {
			System.out.println("w = " + w);
			w++;
		}

-----------------------------
1.1-2 do-while
-----------------------------
*do-while문은 while문의 변형으로 기본적인 구조는 while문과 같으나 조건식과 블럭{}의 순서를 바꿔놓은 것이다.
 그래서 while문과 반대로 블럭{}을 먼저 수행한 후에 조건식을 평가한다. while문은 조건식의 결과에 따라 블럭{}이 한 번도 수행되지 않을
 수 있지만, do-while문은 최소한 한번은 수행될 것을 보장한다.
 
		int dw;
		dw = 10;
		do {
			System.out.println("dw = " + dw);
			dw++;
			
		}while(dw < 10);
		
		//do while문은  값이  true/false 상관없이 한번은 들어간다. (그래서 사용 빈도가 낮다.)
    
-----------------------------
1.1-3 2중 while 문을 이해하기 위한 예제 (for-while)
-----------------------------		

		for (int i = 0; i < 10; i++) {
			System.out.println("i = " + i);
			for (int j = 0; j < 5; j++) {
				System.out.println("j = " + j);		
			}
		}
		
		int w1, w2;
		w1 = w2 = 0;
		
		while (w1 < 10) {
			System.out.println("w1 = " + w1);
			
			w2 = 0;     // 이중 while 문 초기화는 바로 위에서 초기화를 해주어야함.
						// 작성하지 않으면 한번만 실행됨.
			while (w2 < 5) {
				System.out.println("  w2 = " + w2);
				w2++;
			}
			w1++;
		}
		
		while(true) {
			System.out.println("w1 = " + w1);
			w1++;
		}
	


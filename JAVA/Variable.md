변수
===================================================================================
#변수란 하나의 값을 저장할 수 있는 저장공간을 말함.

-------------------------- 
# 1.1변수 선언
----------------------
		
    (변수타입) (변수이름);
		int i;	//int i라는 변수를 선언
		i = 1;  //1을 초기화
		i = 2;


-----------------------    
# 1.2 변수의 종류
----------------------
* 1.2-1 정수[수치형] (byte/short/int/long)

		byte by;	// 1 byte == 8 bit	-> 0 ~ 255 -> 256개   1111 1111  0 -> '+'  1 -> '-'
		by = -128;	// -128 ~ 127
		System.out.println( by );
		
		short sh;	// 2 byte
		sh = 12345;
		System.out.println( sh );
		
		int in;		// 4 byte	-> 32 bit
		in = 123456789;
		System.out.println( in );		
		
		long lo;	// 8 byte
		lo = 32432465435435345L;
		System.out.println( lo );
    
    각 자료형의 변수마다 저장할 수 있는 값의 크기는 다 다름.
    
  
---------------------------------------
* 1.2-2 실수(float/double)
		
  
		float f;	// 4 byte
		f = 123.4567f;
		System.out.println( f );
		
		double d;	// 8 byte
		d = 234.567891234453;
		System.out.println( d );
    
    실수는 뒤에 소숫점이 표시가됨.

---------------------------------------
* 1.2-3 문자형(character)

		char c;		// 2 byte 	// character
					// a ~ z A ~ Z ASCII code (unicode)
		c = 'A';
		c = 'a';
		c = '+';
		c = '한';
		System.out.println( c );
    
    문자형은 한글자만 저장 할 수 있음.
    
----------------------------------------
* 1.2-4 문자열(String)


		// String(class), Array(배열)
		String str;
		str = "Hello";
		System.out.println( str );
		
		str = "World";
		System.out.println( str );
		
		System.out.println( "abc" + 1 + 2 );
		System.out.println( 1 + "abc" + 2 );
		System.out.println( 1 + 2 + "abc" );
    
    숫자+문자열이면 문자가 쌔서 다 문자열로 만들어버림.

--------------------------------------

1.2-5 판정형 (참/거짓) 	

		boolean b;	// 1 byte	(true(1)/false(0))		
		b = true; 
		System.out.println( b );
		b = false;
		System.out.println( b );
    
    진실 혹은 거짓
    
--------------------------------------    
		
2.escape sequence (개행 / backspace / 띄어쓰기 / '' / "")


		// \n == 개행(엔터의 개념?)

		// \b == backspace
		System.out.printf("Hello\bWorld");
		// \t == 띄어쓰기
		
		// \' == '표현
		System.out.println("\'\'");
		
		// \" == "표현
		System.out.println("\"안녕하세요\"");
		
		// \\ = \표현
		System.out.println("\\반갑습니다\\");
    
    print()/printf() 등등 엄청 많이쓴다.
	

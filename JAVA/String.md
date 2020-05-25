String
=======================

		 	String : wrapper class (누군가 정리를 해놓은 것)
		 			문자열저장, 편집, 정보 취득
		 			
-----------------------
1.1-1 String
-----------------------
*String 인스턴스는 한 번 생성되면 그 값을 읽기만 할 수 있고, 변경할 수 없다.
이러한 객체를 자바에서는 불변 객체(immutable object)라고 한다.
		 
		
		String str;
		// class명 : String 
		// str : Object(객체), instance(주체) == class를 변수
		
		str = "안녕하세요";
		System.out.println("str = " + str);

		char strChar[] = { '안' , '녕' , '하' , '세' , '요'};
		strChar[0] = '건';
		strChar[1] = '강';
		
		str = "건강하세요";
		
		String str1 = new String("하이");
	  String str1 = "하이";
		
		String str2 = "반갑습니다";
		
-------------------------
1.1-2 concat()
-------------------------
*해당 문자열의 뒤에 인수로 전달된 문자열을 추가한 새로운 문자열을 반환한다.

		String str3;
		
		str3 = str1 + str2;
		System.out.println("str3 = " + str3);
		
		String str4;
		str4 = str1.concat(str2);	//다른 언어에선 다 이함수씀
		System.out.println("str4 = " + str4);
    
-------------------------
1.1-3 equals()
-------------------------
* 서로 다른 두 문자열/(객체)을(를) 비교한다.
		
		// 비교 함수 equals
		String str5 = "hello";
		String str6 = "hell";
		
		str6 = str6 + "o";
		
		if (str5 == str6) {
			System.out.println("str5와 str6는 같은 문자열입니다.");
			
		}else {
			System.out.println("str5와 str6는 다른 문자열입니다.");
		}
		
		boolean b = str5.equals(str6);
		if(b == true) {
			System.out.println("str5와 str6는 같은 문자열입니다.");
		}
------------------------
1.1-4 indexOf() / lastINdexOf()
------------------------
* indexOf : 해당 문자열에서 특정 문자나 문자열이 전달된 인덱스 이후에 처음으로 등장하는 위치의 인덱스를 반환함.
* lastIndexOf : 해당 문자열에서 특정 문자가 전달된 인덱스 이후에 마지막으로 등장하는 위치의 인덱스를 반환함.

		//indexOf : 지정문자의 위치 (앞에서부터)
		//lastIndexOf : 지정문자의 위치 (뒤에서부터)
		
		char cArr[] = { 'a','b','c'};
		
		String str7 = "abcdefghabcd";
		int n;
		n = str7.indexOf("d");
		System.out.println("n = " + n);
		
		n = str7.lastIndexOf("d");
		System.out.println("n = " + n);
		
		// 길이 legth -> len
		int Array[] = { 1, 2, 3, 4, 5 };
		System.out.println("배열의 길이: " + Array.length);
		
		str7 ="I can do it";
		
		int len = str7.length();
		System.out.println("문자열 길이: " + len);

----------------------------
1.1-5 replace()
----------------------------
* 자신이 바꿔주고 싶은 문자로 문자열을 치환시켜준다.
  
		// replace (수정)
		
		String str8 = "A*B**C";
		String repStr= str8.replace("*", "+");
		System.out.println("repStar:" + repStr);
		
		String s = "신종 코로 나 바이러스 감염증(코 로나19)이 전국에서 산발적, 지속적으로";
		String rs = s.replace(" ","");
		System.out.println("rs = " + rs);
		
		
-------------------------
1.1-6 split()
-------------------------
*token을 활용해서 문자열을 자른다.
			  
		  aaa-bbb-ccc  		- : 토큰
		  
		  저장매체 : 파일 , database(oracle) , 
		  
		  홍길동-24-2001/10/12-180
		  
		
		String str9 ="홍길동-24-2001/10/12-180.2";
		String splitArr[] = str9.split("-");
		
		for (int i = 0; i < splitArr.length; i++) {
			System.out.println(splitArr[i]);
		}
    
-------------------------
1.1-7 substring()
-------------------------
*해당 문자열의 전달된 시작 인덱스부터 마지막 인덱스까지를 새로운 문자열로 반환한다.
		
		// 범위를 통해서 문자열을 취득 substring()
		String str10 = "abcdefghij";
		String subStr = str10.substring(0, 4); // 지정할 숫자 +1 (a~d사이)
		System.out.println("subStar = "+ subStr);
		
		subStr = str10.substring(4);		// 위치를 지정해주면 지정해준 곳부터 끝까지 출력
		System.out.println("subStar = "+ subStr);
    
-------------------------
1.1-8 toUpperCase()/toLowerCase()
-------------------------
*해당 문자열의 모든 문자를 대/소문자로 변경한다.
		
		// toUpperCase	모든 문자 대문자로 변경
		// toLowerCase	모든 문자 소문자로 변경
		// abcd == ABCD, abcd
		String str11 = "abcDEF";
		String upStr = str11.toUpperCase();
		System.out.println("upStr = " + upStr);
		
		String lowStr = str11.toLowerCase();
		System.out.println("lowStr = " + lowStr);
		
--------------------------
1.1-9 trim()
--------------------------
* 문자열의 앞 뒤의 공백을 없애주는 함수이다.

		// trim (많이사용)
		String str12 = "                        java c언어 python           ";
		String trimStr = str12.trim();
		System.out.println("trimStr = " + trimStr + "--");  // ID를 입력했을 때 스페이스바를 없애주는 데 사용
		
--------------------------
1.1-10 valueOf()
--------------------------
* 해당 객체를 String 객체로 변환시키는 역활을 합니다. 말그대로 String의 객체로 형변환입니다. 


		 문자열 -> 숫자 "123" -> 123
		 숫자 -> 문자열 123 -> "123"
		 	
		 숫자 -> 문자열 (valueOf)
		 	 	
		 
		
		int num = 123;
		long lo = 1234L;
		double d = 123.4567;
		
		String is = String.valueOf(num);
		String ls = String.valueOf(lo);
		String ds = String.valueOf(d);
		
		System.out.println(num+lo+d);
		System.out.println(is + " " + ls + " " + ds);
		
		int number =234;
		String numStr = number + "";
		
		
---------------------------
1.1-11 contains()
---------------------------		
*대상 문자열에 특정 문자열이 포함되어 있는지 확인하는 함수이다.    
    // contains 탐색
		
		String str13 = "서울시 강남구";
		boolean b1 = str13.contains("서울");
		System.out.println("b1 = " + b1);
		
		
		//charAt			array[2] ->
		//String str = "hello"	== charArray[5]
		
		String str14 = "가나다라마";
		char ch = str14.charAt(3);
		System.out.println(ch);
				
	}



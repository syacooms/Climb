WrapperClass
===================================
    * Wrapper Class 일반 자료형(int, char)을 클래스화 한것 Collection : list , map
		 * 
		 * 일반자료형 class boolean Boolean
		 * 
		 * byte Byte short Short int Integer (0) ----------------- long Long
		 * 
		 * 
		 * float Float double Double (0) -----------------
		 * 
		 * char Character char[] String (*****) -----------------   //가장 많이 쓴다.
     
----------------------------------
1.1-1 WrapperClass
----------------------------------
* 8개의 기본 타입에 해당하는 데이터를 객체로 포장해 주는 클래스를 래퍼 클래스(Wrapper class)라고 한다.
		

		// 숫자 -> 문자열
		// valueOf
		// 123+""; 123.456 + ""; => "123.456"

		// 문자열 -> 숫자
		String strNum = "234";
		int cnum = Integer.parseInt(strNum);
		System.out.println("cnum = " + (cnum + 1));

		String dstrNum = "123.456";
		double dnum = Double.parseDouble(dstrNum);
		System.out.println("dnum = " + (dnum + 1.1));

		// toString(); -> 문자열로 변경해준다. -> valueOf();

		Double dou = 235.789;
		Double dou1 = new Double("345.678");

		// 10진수 -> 2진수
		int n10 = 12;
		String n2 = Integer.toBinaryString(n10);
		System.out.println("n2:" + n2);

		n2 = "11001010";
    
	}

}

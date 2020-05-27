		
method(function)
=======================================
    
    
		  function : 함수 , 독립적인 프로세스 method : 함수, class에 포함되어 있는 함수
		  
		  C언어 : function Java : class
		  
		  목적 : 코드의 간략화. 동일한(같은 처리) 코드를 집약적으로 설정.
		  
		  가독성 : 이해하기 쉽게 작성. 글이 읽힐 수 있는 능률의 정도
		  
		  형식 인수, 인자 , 매개 변수, parameter return 값(자료형) 함수명(자료형 가상인수, ...) {
		  
		  처리
		  
		  return 값; <- 없을 수도 있음.
		  
		  
		  }
		  
		  return 값(자료형) : char int double int[] String void(return값이 없음)
		  
		  
		  int funcName(char c, double d){ 처리
		  
		  return 값; <- 정수(int) }
		 
		 
------------------------------------------------		 
		function();
    
    static void function() {

		System.out.println("fuction() 호출");
	  }
  
    //출력
    fuction() 호출

-----------------------------------------------

		function1(12);
    
    static void function1(int n) {
    
		System.out.println("function1(int n) 호출 n = ");
		System.out.println("매개변수를 통한 가인수 n =" + n);
	  }
    
    //출력
    function1(int n) 호출 n = 
    매개변수를 통한 가인수 n =12 

-----------------------------------------------
	  
    
		function2("My World", 123.456);
    function2("You World", 123);
    
    
	  static void function2(String str, double d) {
		System.out.println("function2(String str, double d) 호출");
		System.out.println("str = " + str);
		System.out.println("d = " + d);
	  }
  
    //출력
    function2(String str, double d) 호출
    str = My World
    d = 123.456
    function2(String str, double d) 호출
    str = You World
    d = 123.0
  
-----------------------------------------------  


		int returnValue = function3(333.4444);	//value에 의한 할당 
		System.out.println("returnValue = " + returnValue);

	  static int function3(double d) {      // 가상 인수에 직접 value 값을 입력해준다.
		System.out.println("function3(double d) 호출");
		System.out.println("d = " + d);

		return (int) d;   // 리턴 형변환 더블 파라미터를 정수값으로 
    }
    
    //출력
    function3(double d) 호출
    d = 333.4444
    returnValue = 333

----------------------------------------------

		int asc = getASCIIcode('A');
		System.out.println("asc = " + asc);
		System.out.println(getASCIIcode('a'));

    static int getASCIIcode(char c) {
		return (int) c;                 // 정수형으로 리턴 
	  }

  
    //출력
    asc = 65                        //(int) A
    97                              //(int) a

---------------------------------------------


		int num = function4();
		System.out.println("num = " + num);  
    
    static int function4() {
		System.out.println("function4() 호출");
		return 12;                // 리턴값 12로 반환
	  }
    
    //출력
    function4() 호출
    num = 12

----------------------------------------------    
		int arrNum[] = { 1, 2, 3, 4, 5 };
		arrProcess( arrNum ); // address에 의한 할당

	  static void arrProcess(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
		System.out.println("arr[" + i + "] = " + arr[i]);
		}
    
    
    //출력
    arr[0] = 1
    arr[1] = 2
    arr[2] = 3
    arr[3] = 4
    arr[4] = 5

	


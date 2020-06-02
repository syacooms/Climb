Constructor (생성자)
===========================



       public class MyClass {
		    	constructor :  생성자 == method
		 			          	:  class 명과 같은 method
		 			          	:  return 값이 없다.
		 			          	:  over load가 가능.
		 			          	:  자동호출된다.
		 			          	:  별도의 호출이 불가능하다.
		 		          		:  생략이 가능하다.
		 			          	:  기본값을 설정할 경우 많다.
		 			          	:  초기화는 사용안하는 편이 좋다.
		 				  
-------------------------
1.1-1. constructor
-------------------------
# 생성자는 인스턴스가 생성될 때 호출되는 '인스턴스 초기화 메서드'이다. 따라서 인스턴스 변수의 초기화 작업에   
  주로 사용되며, 인스턴스 생성 시에 실행 되어야 하는 작업을 위해서도 사용된다.
		
		//클래스내 인스턴스(멤버)변수
		private int number;
		private String name;
		
		public MyClass(){ 	// 기본 생성자
			System.out.println("MyClass MyClass()");
		}
		

-----------------------
1.1-2 this()
-----------------------
* 같은 클래스의 멤버들 간에 서로 호출 할 수 있느 ㄴ것처럼 생성자 간에도 서로 호출이 가능하다. 단, 다음의 두 조건을 만족 시켜야한다.
- 생성자의 이름으로 클래스이름 대신 this를 사용한다.
- 한 생성자에서 다른 생성자를 호출할 때는 반드시 첫 줄에서만 호출이 가능하다.



		public MyClass(int number) {
			this.number = number;
			System.out.println("MyClass MyClass(int number)");
		}



		public  MyClass(int number, String name) { //over load가 가능
			this(34);
			
			this.number = number;
			this.name = name;
			
			System.out.println("MyClass MyClass(int number, String name)");
			
		}
    

		

		public MyClass(int number, String name) {
			this(); // 다른 생성자를 호출
			this.number = number;
			this.name = name;
		}

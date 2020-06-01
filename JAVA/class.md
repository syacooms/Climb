class
=========================================
1.1-1 class 
-----------------------------------------
* 클래스란 '객체를 정의해 놓은 것.' 또는 클래스는 '객체의 설계도 또는 틈'이라고 정의할 수 있다.
  클래스는 객체를 생성하는데 사용되며, 객체는 클래스에 정의된 대로 생성된다.
  
		 	class MyClass{      //class 설계
		 		변수(member) - 접근지정(외부, 내부)
		 		
		 		함수(메소드) - 처리
		 		
		 		  
		 	
		 	
		 	}
		 	
		 	클래스명 변수(instance) = new 클래스명();
		 	MyClass cls = new MyClass();
		 		stack(스택)  heap(힙)
		 	
		 	MyClass cls = null; -> (0)		
		 	
		 	
-------------------------------------		 	
1.1-2 객체
-------------------------------------
* 객체는 속성과 기능, 두종류의 구성요소로 이루어져 있으며, 일반적으로는 객체는 다수의 속성과 다수의 기능을 갖는다.
* 즉, 객체는 속성과 기능의 집합이라고 할 수 있다. 그리고 객체가 가지고 있는 속성과 기능을 그 객체의 멤버라 한다.
* 클래스란 - 객체를 정의 한 것이므로 클래스에는 객체의 모든 속성과 기능이 정의되어있다. 클래스로부터 객체를 생성하면, 클래스에 정의된 속성가 기능
  을 가진 객체가 만들어지는 것이다.

        
       public class TV { //class 설계
  
      //속성(변수)
	    String name;    
	    int channel;
	    boolean power;
	
      //기능(메서드)
	    public void getInput(String n, int c, boolean p) { 
		  name = n;
		  channel = c;
		  power = p;
	  }
	
	  public void setPower(boolean p) {
		
	  }
	
	    public void method() {
		    System.out.println("name = " + name);
		    System.out.println("channel = " + channel);
		    System.out.println("power = " + power);
	  }
  }
		 	
	
-------------------------------------
1.1-3 객체의 생성과 사용
-------------------------------------
> 클래스명 변수명; -> 클래스의 객체를 참조하기 위한 참조변수를 선언
>> 변수명 = new 클래스명(); -> 클래스의 객체를 생성 후, 객체의 주소를 참조변수에 저장

> Tv t; -> Tv클래스 타입의 참조변수 t를 선언
>> t = new Tv(); -> Tv 인스턴스를 생성한 후, 생성된 Tv인스턴스의 주소를 t에 저장 

    package main;

    import myClass.Student;
    import myClass.TV;

    public  mainclass   {

	  public static void main(String[] args) {
		
		
		// TV -> 2대
		String name[] = new String [10]; // 삼성, 엘지
		int channel[] = new int [10]; // 채널
		boolean power[] = new boolean[10]; //on-off
		
		
		
		name[0] = "삼성";
		name[1] = "LG";
		
		channel[0] = 11;
		channel[1] = 23;
		
		
		power[0] = true;
		power[1] = false;
		

		
		TV tv1 = new TV();   // tv1 -> instance(주체): 메모리상에 존재하는 요소
		tv1.getInput("LG",11, true);
		tv1.method();
		
		TV tv2 = new TV();	// tv2 -> object라고도 한다.
		tv2.getInput("삼성",23, false);
		tv2.method();
		
		//배열만을 동적 할당
		TV arrTv[] = new TV[3]; // TV arrTv1, arrTv2, arrTv3;
		
		//객체를 동적할당
		for (int i = 0; i < arrTv.length; i++) {
			arrTv[i] = new TV();
		}
		arrTv[0].getInput("aaa", 1, true);
		arrTv[1].getInput("bbb", 1, true);
		arrTv[2].getInput("ccc", 1, true);
		
		arrTv[1].setPower(false);
		arrTv[2].setPower(false);
		arrTv[1].setPower(false);
		
		
                
      //출력
      name = LG
      channel = 11
      power = true
      name = 삼성
      channel = 23
      power = false
      name = aaa
      channel = 1
      power = true
      name = bbb
      channel = 1
      power = true
      name = ccc
      channel = 1
      power = true


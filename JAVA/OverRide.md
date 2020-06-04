Over Ride
=====================================
* 조상 클래스로부터 상속받은 메서드의 내용을 변경하는 것을 오버라이딩이라고 한다. 상속받은 메서드를 그대로 사용하기도 하지만,
  자손 클래스 자신에 맞게 변경해야하는 경우가 많다. 이럴 때 조상의 메서드를 오버라이딩한다.

   
   
   public class Parant {
	    public Parant(){
		
	    }
	
	  public  Parant(int number) {
		
	   }
	  	Over Ride
	 	  상속 받은 후에 상속 받은 클래스(자식 클래스)에서 고쳐 기입함을 의미한다.
	 	
	    public void method() {
	  	System.out.println("Parant method()");
	   }
    }
    
     public class Child extends Parant {
	
	    public Child() {
	    //	super();
	    //	super( 123 );
	    }
	
	    // Over Ride 실시한 method
	    // Over Ride 의 목적 : 관리
	    public void method() {
	    	System.out.println("Child method()");
	    //	super.method(); <- 부모 클래스 메소드도 호출 가능함.
    	}
	    
      //조상 클래스의 메서드보다 많은 수의 예외 선언 불가 
      
    	public void func() {
	    	System.out.println("Child func()");
    	}
    }
   
-----------------------------------
    package main;

    public class mainClass {

      public static void main(String[] args) {
	    	
	    	// Child c = new Child();
		
	    	// c.method();
	    	
	    	Parant p = new Child();
		
	    	p.method();

      }

    }

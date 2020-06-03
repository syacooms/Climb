Inheritance1(상속)
=====================================
* 상속이란, 기존의 클래스를 재사용하여 새로운 클래스를 작성하는 것이다.
* 상속을 통해서 클래스를 작성하면 보다 적은 양의 코드로 새로운 클래스를 작성할 수 있고 코드를 공통적으로 관리할 수 있기 때문에
  코드의 추가 및 변경이 매우 용이하다.

		 	은닉성 : 접근 지정자를 통해서 외부로부터 접근을 차단, 허용해 주는 것을 의미
		 			private(무조건) , public(허용)
		 			variable		method
		 	
		 	상속성 : 부모클래스에서 기능을 상속한다.
		 			variable	method
		 			추가로 기능을 확장하는 경우
		 			
		 	다형성 : 상속 후에 여러 형태로 자식 클래스가 구현되는 것을 의미
		 		      부모	직사각형
		 		정사각형 마름모 삼각형 원
		 		
		 	super 
		 	Over Ride(받은 재산을 수정해서 확장[고쳐 기입]) - 관리의 목적


--------------------------
1.1-1 extends
--------------------------
*자바에서 구현하는 방법은 새로 작성하고자 하는 클래스의 이름 뒤에 상속받고자 하는 클래스의 이름을 키워드와 함께 써주면 된다.


    public class Child extends Parant {
					// 상속 받을때는 exteds - 부모 클래스 상속

--------------------------
1.1-3 super()
--------------------------
* super()는 조상의 생성자를 호출하는데 사용된다.

	  public Child() {
		// super : 부모 클래스의 reference(pointer == 주소)
		// this : 자기 자신의 참조
		super(2);
		// 슈퍼에 숫자를 넣으면 매개변수가 있는 생성자를 받는다.
		
		System.out.println("Child Child()");
	  }
	
	  public Child (int num) {
		super(num);
	
	  }
	
	  public  void func() {
	  //	number = 1;
		name = "홍길동";
  	    }
  
        public class Parant {

	  private int number;
	  protected String name;
	  // protected : 자식 클래스에서는 접근을 허용. 외부에서 접근 차단
	
	

	  public void Parant() { // 기본 생성자
		System.out.println("Parant Parant()");
        }
    
    
      public Parant(int number) {
      this.number = number;
      System.out.println("Parant Parant(int number)");
      }
	
	  public void Parant_method() {
	  	System.out.println("Parant Parant_method()");
		
	  }
	

------------------------------

    public class mainClass {
  
  	public static void main(String[] args) {
	
		Child c = new Child();
		
		//c.name = "일지매";
		
		c.Parant();
		
		Child cls = new Child(123);
		
		cls.Parant_method();
	}

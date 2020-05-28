varargs(가변인수)
==========================================
* 매개변수로 들어오는 값의 개수와 상관 없이 메소드가 기능하도록 해주는 매개변수.
* 매개변수로 전달되는 인자들의 자료형은 반드시 같아야 한다.
* 가변인수는 매개변수 가장 마지막에 작성해야 한다.
------------------------------------------
  
    public static void main(String[] args) {       
    allocParam(1, 2, 3, 4, 5);   
		allocParam(23, 45, 39);   
		func("hello", 2,3,4);   
      }
      
    static void allocParam(int...num) {    	// (int num[])
    int sum = 0;   
    for (int i = 0; i < num.length; i++) {   
    sum = sum + num[i];   
			
		}   
		System.out.println("합계:" + sum);   
		
	}   
	static void func(String str, int...num) {   
		System.out.println("str = " + str);   
		for (int i = 0; i < num.length; i++) {   
			System.out.print(num[i] + " ");   
		}   
		System.out.println();
    
	}
--------------------------------------------

    //출력   
    합계:15   
    합계:107   
    str = hello   
    2 3 4    

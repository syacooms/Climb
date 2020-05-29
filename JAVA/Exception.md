Exception(예외 처리)
========================================



		
		 * Exception : 예외 != 에러
		 * 
		 * 예외가 발생해서 그 값이 발생 하는 것을 막아라.
		 * 
		 * baseball -> 1 2 3 ~ 10 -> 'A' -> 65
		 * 
		 * number -> format 1~3 -> (int)'A' array -> index number[3]
		 * 
		 * class -> Scanner 못찾는 경우 file -> 없을 경우
		 * 
		 * try {
		 * 
		 * 예외 1이 나올 수 있는 소스 예외 2가 나올 수 있는 소스
		 * 
		 * 
		 * } catch(예외 클래스1 e ){ 메세지 } catch(예외 클래스2 e ){ 메세지
		 * 
		 * 
		 * 
		 * } finally{ // 생략이 가능합니다. // 무조건 실행합니다. // 뒤처리 파일 close Database 원상복구 rollback
		 * -> undo
		 * 
		 
     
 ---------------------------------------------
 1.1-1 Exception class
 ---------------------------------------------
 *Exception은 컴파일 또는 실행중에 생길 수 있는 예외처리(Exception handling)를 말한다.
 *예외처리(Exception handling)란, 프로그램 실행 시 발생할 수 있는 예기치 못한 예외의 발생에 대비한 코드를
  작성 하는 것이며, 예외처리의 목적은 예외의 발생으로 인한 실행중인 프로그램의 갑작스런 비정상 종료를 막고,
  정상적인 실행상태를 유지할 수 있도록 하는 것이다.
        
      
      public static void main(String[] args) {   
      int array[] = { 1, 2, 3 };   
      System.out.println("프로그램 시작");
      
---------------------------------------------
1.1-2 try - catch문
---------------------------------------------
* 하나의 try 블럭 다음에는 여러 종류의 예외를 처리할 수 있도록 하나 이상의 catch블럭이 올 수 있으며,
  이 중 발생한 예외의 종류와 일치하는 단 한 개의 catch 블럭만 수행된다. 발생한 예외의 종류와 일치하는
  catch블럭이 없으면 예외는 처리하지 않는다.
		try {

			for (int i = 0; i < 4; i++) {
				System.out.println(array[i]);
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("배열 범위 초과");
			// e. printStackTrace();                  //printStackTrace() => 예외발생 당시의 호출스택에 있었던 메서드의 정보와 예외메세지 출력
			// System.out.println(e.getMessage());    //getMessage() => 발생한 예외클래스의 인스턴스에 저장된 메세지를 얻을 수 있다.

		} catch (NumberFormatException e) {
			e.printStackTrace();
			
      
> * try블럭 내에서 예외가 발생한 경우
>> #발생한 예외와 일치하는 catch블럭이 있는지 확인한다.
>> #일치하는 catch블럭을 찾게 되면, 그 catch블럭 내의 문장들을 수행하고 전체 try-catcho문을
    빠져나가서 그 다음 문장을 계속해서 수행한다. 만일 일치하는 catch블럭을 찾지 못하면, 예외는 처리되지 못한다.
> * try 블럭 내에서 예외가 발생하지 않은 경우
>> #chtch블럭을 거치지 않고 전체 try-chatc문을 빠져나가서 **'수행을 계속'**한다.

----------------------------------------------
1.1-3 finally
----------------------------------------------
* finally 블럭은 예외의 발생여부에 상관없이 실행되어야할 코드를 포함시킬 목적으로 사용된다.
  try-catch문의 끝에 선택적으로 덧붙여 사용할 수 있으며, try-catch-finally의 순으로 구성된다.

		} finally {
			System.out.println("무조건 실행된다.");

		}
		System.out.println("프로그램 끝");


	    }

----------------------------------------------
1.1-4 throws
----------------------------------------------
* 메서드에 예외를 선언하려면, 메서드의 선언부에 키워드 throws를 사용해서 
  메서드 내에서 발생 할 수 있는 예외를 적어주기만 하면 된다.

	  static void func() throws ArrayIndexOutOfBoundsException {

		try {
			int array[] = { 1, 2, 3 };

			for (int i = 0; i < 4; i++) {
				System.out.println(array[i]);
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		    }
	    }
	
	  static void func1() throws ArrayIndexOutOfBoundsException {
		
		int array[] = { 1, 2, 3 };
		
		for (int i = 0; i < 4; i++) {
			System.out.println(array[i]);
			}
		
		 // func == func1 처리는 똑같다.
		 
		
	      }
      }

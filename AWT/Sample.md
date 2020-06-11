Abstract Window Toolkit
============================================
 		        Applicatin -> App
		 	자동화 기능 -> Application(C#)
		 	Web -> editor
		 	
		 	AWT , swing -> User Inertface(연결)
		 	
		 	Abstract Window Toolkit == Android
		 	button, label, textField...
		 	
		 	Application <==> Database 
		 				JDBC
--------------------------------------------
* 윈도우 프로그래밍을 위한 UI 컴포넌트와 보조라이브러리를 모아놓은 tool kit.
* 한번즘 해보는 것도 나쁘진 않다고 했는데 기능 자체는 'WEB' 쪽에서 구현 할 것이라고 함.
>>신기함. 필요에 따라 인터페이스를 다중상속받기도 한다.
  
  
     public class WindowTest extends Frame implements WindowListener{
	public WindowTest() {
	
		setSize(640, 480); // 윈도우 폭, 높이
		setLocation(0, 0); // 윈도우 실행 위치
		setVisible(true); // 윈도우 시각화
		
		// Listener 
		addWindowListener(this);
		
		// C# -> web(ASP.net)
		// PHP > JSP > ASP 
	}

	@Override
	public void windowOpened(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("windowOpened");
	}

	@Override
	public void windowClosing(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("windowClosing");
		System.exit(0);
	}

	@Override
	public void windowClosed(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("windowClosed");
	}

	@Override
	public void windowIconified(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("windowIconified");
	}

	@Override
	public void windowDeiconified(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("windowDeiconified");
	}

	@Override
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("WindowActivated");
		
	}

	@Override
	public void windowDeactivated(WindowEvent e) {
		// TODO Auto-generated method stub
		System.out.println("windowDeactivated");
	}
	
	

    }
    
-------------------------------------------------------
        
	public static void main(String[] args) {
 		  new WindowTestJ();
	}


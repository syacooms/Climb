CheckBox
===================================================

		
			Check Box (취미) 	- 다중선택
			Radio Button		- 하나선택
			
			AWT : radio -> checkbox
			swing : JRadioButton
			
		

--------------------------------------------------


      public class mainClass {
	    public static void main(String[] args) {
		    new WindowTest();
  	    }
     }

--------------------------------------------------
   *Checkbox를 구현하는 소스. 체크를 할때마다 label 안의 text도 바뀜.
   
   public class WindowTest extends JFrame implements ItemListener {
	    Checkbox cb1, cb2, cb3, cb4, cb5, cb6;
	    Label label1, label2;
	
	    JRadioButton radioBtn;
	
	  public WindowTest() {
		CheckboxGroup cbg1 = new CheckboxGroup();
		// cb1, cb2, cb3
		cb1 = new Checkbox("사과", cbg1, true);
		cb2 = new Checkbox("배", cbg1, false);
		cb3 = new Checkbox("바나나", cbg1, false);
		
		CheckboxGroup cbg2 = new CheckboxGroup();
		// cb4, cb5
		cb4 = new Checkbox("빨강", cbg2, false);
		cb5 = new Checkbox("파랑", cbg2, true);
		
		cb6 = new Checkbox("exit");
		
		label1 = new Label("label1");
		label2 = new Label("label2");
		
		add(cb1);
		add(cb2);
		add(cb3);
		add(cb4);
		add(cb5);
		add(cb6);
		
		cb1.addItemListener(this);
		cb2.addItemListener(this);
		cb3.addItemListener(this);
		cb4.addItemListener(this);
		cb5.addItemListener(this);
		cb6.addItemListener(this);
		
		
		add(label1);
		add(label2);
		
		setLayout(new FlowLayout());
		
		
		
		
		setBounds(0,0,640,480);
		setVisible(true);
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	  }

	@Override
	public void itemStateChanged(ItemEvent e) {
		//JOptionPane.showMessageDialog(null, "클릭");
		
		Object obj = e.getSource();
		
		if(obj == cb6) {
			Checkbox cb = (Checkbox)obj;
			if(cb.getState()) { //체크 되었다.
				System.exit(0);
				
			}else {	// 체크가 안되었음.
				
			}
		}
		else if(obj == cb1 || obj == cb2 || obj == cb3) {
			Checkbox cb =(Checkbox)obj;
			if(cb.getState()) {
				label1.setText(cb.getLabel());
			}
		}
		else if(obj == cb4 || obj == cb5) {
			Checkbox cb =(Checkbox)obj;
			if(cb.getState()) {
				label2.setText(cb.getLabel());
			}
		}
		
	  }
    }

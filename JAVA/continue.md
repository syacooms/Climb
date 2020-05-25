contiune
==========================
		 	
		 	continue : skip(생략)
		 			그 다음 처리 생략
		 			for , while
		 			
		 	loop{
		 		처리1
		 		처리2
		 		if continue
		 		처리3		<- 처리하지 않고 생략
		 	}
-------------------------
1.1-1 continue문
-------------------------
*continue문은 반복문 내에서만 사용될 수 있으며, 반복이 진행되는 도중에 continue문을 만나면 반복문의 끝으로 이동하여 다음 반복으로 넘어간다.
 for문의 경우 증감식으로 이동하며, while문과 do-while문의 경우 조건식으로 이동한다.
		
		for (int i = 0; i < 10; i++) {
			System.out.println(" i = " + i);
			System.out.println("for start");
			if(i > 5) {
				continue;
			}
			System.out.println("for end");	
		}
		
		Scanner scanner = new Scanner(System.in);
		
		int numArr[] = new int [3];
		int n;
		
    
		for (int i = 0; i < numArr.length; i++) {
			 System.out.print((i + 1) + "번째 수 = ");
			 n = scanner.nextInt();
			 if(n < 0) {
				 System.out.println("음수입니다.");
				 continue;
			 }
			numArr[i] = n;
		}
		for (int i = 0; i < numArr.length; i++) {
			System.out.println("numArr[" + i +"] = " + numArr[i] );
		}


    //while
		int w = 0;
		int arrNum[] = new int[3];
		while(w < 3) {
			System.out.println(((w + 1) + "번째 수 = "));
			n=scanner.nextInt();
			
			if(n < 0) {
				System.out.println("음수입니다.");
				continue;
				
			}
			arrNum[w] = n;
			
			w++;  //if문과 다른점 . 마지막값을 계속 음수면 무한 루프
		}    
	}


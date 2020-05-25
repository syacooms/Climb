two-DimensionalArray
=============================
1.1-1 two-DimensionalArray
-----------------------------
*2차원 배열이란 배열의 요소로 1차원 배열을 가지는 배열이다.
자바에서는 2차원 배열을 나타내는 타입을 따로 제공하지 않는다.   
*3차원 이상의 고차원 배열인 다차원배열(multi-dimensional array)의 선언은 대괄호[]의 개수를 차원의 수만큼 추가해 주기만 하면 된다.	 	
		 	
		 	int Array2[3][4] = {
		 	
		 		{1, 2, 3, 4 },
		 		{5, 6, 7, 8 },
		 		{9, 10 ,11, 12 },
		 		
		 	
		 	};
		 	
      //표기방법
		 	int Array2[][] = new int[3][4];
		 	int []Array2[] = new int[3][4];
		 	
		 	
		
			int Array2[][] = {
				{1, 2, 3, 4 },
			 	{5, 6, 7, 8 },
			 	{9, 10 ,11, 12 }
			};
			
			for (int i = 0; i < Array2.length; i++) {	//  Array2.length -> 3
				for (int j = 0; j < Array2[0].length; j++) {	// Array2[0].length -> 4    //j열부분 늘릴때는 Array2[요소] 길이 붙이기.
					System.out.println(" Array2[" + i + "][" + j + "] = " + Array2[i][j]);
				}
				
			}
		

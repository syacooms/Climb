sorlting (정렬)
======================
1.1 선택 정렬(Selection sorlt)   

* 정렬 숫자의 크기에 따라서 순번대로 배치하는 처리. 오름(큰 값이 뒤로), 내림차순(큰값이 앞으로) 정렬이 있다.
----------------------
#로직
1. 정렬되지 않은 인덱스의 맨 앞에서부터, 이를 포함한 그 이후의 배열값 중 가장 작은 값을 찾아간다.
2. 가장 작은 값을 찾으면, 그 값을 현재 인덱스의 값과 바꿔준다.
3. 다음 인덱스에서 위 과정을 반복해준다.    
          
          
        // sorlting의 종류 (선택, 버블, 합병, 퀵)
       //선택 정렬 
      		int number[] = { 1, 5, 2, 4, 3 };
		      int temp;	// swap용 변수
		
		for (int i = 0; i < number.length - 1; i++) {		// 0               1         2       3 
			
			for (int j = i+1; j < number.length; j++) {		// j = 1 2 3 4 j = 2 3 4 j = 3 4 j = 4
				
			  if(number[i] > number[j]) { // > 오름차순
				    temp = number[i];
				    number[i] = number[j];
				    number[j] = temp;
					
				}
			}
		}		
		for (int i = 0; i < number.length; i++) {
			System.out.println("number[" + i + "] = " + number[i]);
		}


    

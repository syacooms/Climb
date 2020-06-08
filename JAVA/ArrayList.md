ArrayList
===============================================

		 		
		 	ArrayList(== Vector)
		 		배열처럼 사용할 수 있는 목록
		 		선형구조 o-o-o-o-o-o-o
		 		검색 속도 빠르다.
		 		index number로 관리된다.	0 ~ n-1
		 		o-o-o-o-o-o
		 		
-----------------------------------------------
1.1-1 ArrayList
-----------------------------------------------
* 컬렉션 프레임워크에서 가장 많이 사용되는 클래스.
>> 컬렉션 프레임워크란? 데이터군을 저장하는 클래스들을 표준화한 설계. 다수의 데이터를 저장한다? 이정도
* ArrayList는 Object 배열을 이용해서 데이터를 순차적으로 저장한다. 배열에 더이상 저장할 공간이 없으면 보다 큰 배열을 생성해서 기존 배열을
  새로운 배열로 복사한다.
>> array[3] {0, 1, 2, 3...} >>?? array[new] {0, 1, 2, 3 >>>>4 , 5, ~~~~}
		 
-----------------------------------------------
1.1-2 .add() 추가
-----------------------------------------------

		public static void main(String[] args) {	
    
		ArrayList<Integer> arrList = new ArrayList<Integer>();
		
		// 추가
		arrList.add(111);
		
		Integer in = new Integer(222);  //요것이 정석
		arrList.add(in);
		
		arrList.add( new Integer(333) );

----------------------------------------------
1.1-3 .get() / .size() 산출 및 크기
----------------------------------------------
* .size() 배열의 크기를 알거나, .get()으로 배열의 요소부분을 알때 같이 사용함.
		
		// list size()
		int len = arrList.size();
		System.out.println("len = " + len );
		
		// 데이터를 산출 get
		Integer getVal = arrList.get(0);
		System.out.println("getVal:" + getVal);
		
		for (int i = 0; i < arrList.size(); i++) {
			Integer n = arrList.get(i);
			System.out.println(i + ":" + n);
		}
		
		for(Integer inte : arrList) {	// for each 
			System.out.println(inte);
		}
   
   
--------------------------------------------
1.1-4 .add(index,element) / .remove() 추가 및 삭제
--------------------------------------------
* .add(index,element) index에 해당하는 범위를 element에 숫자를 지정해줌으로서, 추가가 가능하다.
* .remove() 생성자 안에 해당 범위를 작성하면 지정 배열 삭제가 가능하다.
		
		// 원하는 위치에추가
		Integer inum = new Integer(200);
		arrList.add(1, inum);
		
		for (int i = 0; i < arrList.size(); i++) {
			Integer n = arrList.get(i);
			System.out.println(i + ":" + n);
		}
		
		// 삭제	Array obj[0].name = "";
		arrList.remove(2);
		
		for (int i = 0; i < arrList.size(); i++) {
			Integer n = arrList.get(i);
			System.out.println(i + ":" + n);
		}
		
-----------------------------------------------------		
1.1-5 .indexOf() 검색
-----------------------------------------------------
* .indexOf() 지정한 요소의 index를 찾을 수 있다. index로 초기화 한 후 get(index)로 출력.
		
		// 검색
		int index = arrList.indexOf(333);
		System.out.println("index : " + index);
		System.out.println(arrList.get(index));
		
		index = - 1;
		for (int i = 0; i < arrList.size(); i++) {
			Integer var = arrList.get(i);
			if(var == 200) {
				index = i;
				break;
			}
		}
		System.out.println("index:" + index);
		

	

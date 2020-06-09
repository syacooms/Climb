HashMap
==============================================
*HashMap은 키(key)와 값(value)을 묶어서 하나의 데이터(entry)로 저장하는 특징을 갖는다. (HashMap<K,V>)

		/*
		 	HashMap : 사전
		 			  "사과":"apple"
		 			  key : value -> 1pair == web json
		 			  Tree 구조
		 			  key는 중복되지 않는다.
		 			  
		 			  List : 선형 구조 o-o-o-o-o---->
		 			 
---------------------------------------------

public class MyData {

	private int number;
	private String name;
  // constructer/getter setter/to string 모두 클래스내에 작성햇다고 가정한다.

---------------------------------------------

		public static void main(String[] args) {
		HashMap<Integer, String> hMap = new HashMap<Integer, String>();

---------------------------------------------
1.1-1 .put(k,v)
---------------------------------------------
*지정된 키와 값을 HashMap에 저장한다.
		
    // 추가
		hMap.put(111, "백십일");
		hMap.put(222, "이백이십이");
		hMap.put(333, "삼백삼십삼");
		
---------------------------------------------
1.1-2 .get()
---------------------------------------------
*지정된 키(key)의 값(객체)을 반환한다. 못찾을 경우 null로 반환한다.

    
		// value 취득
		String value = hMap.get(222);
		System.out.println("value:" + value);
		
---------------------------------------------
1.1-3 .remove()
---------------------------------------------
*HashMap에 지정된 키로 저장된 값을 제거
		
		// 삭제
		//String val = hMap.remove(222);
    
---------------------------------------------
1.1-4 boolean containsKey() 
---------------------------------------------
*HashMap에 지정된 키(key)가 포함되어 있는지 알려준다.

		// 검색
		// 있다/없다
		boolean b = hMap.containsKey( new Integer(333) );
		System.out.println("b = " + b);
		
		// 값을 취득
		if(hMap.containsKey(333)) {
			value = hMap.get(333);
			System.out.println("value : " + value);
		}
		
---------------------------------------------
1.1-5 .replace
---------------------------------------------

* 지정된 키의 값을 지정된 객체로 대체
		
		// 수정
		hMap.put(111, "100 + 10 + 1");
		
		hMap.replace(222, "200 + 22" ); 	//정석
    
---------------------------------------------		
1.2 Iterator
---------------------------------------------
*iterator()는 Collection 인터페이스에 정의된 메서드이므로 Collection 인터페이스의 자손인 List와 Set에도 포함되어 있다.   
그래서 List나 Set 인터페이스를 구현하는 컬렉션은 iterator()가 각 컬렉션의 특징에 알맞게 작성되어 있다.
컬렉션 클래스에 대해 iterator()를 호출하여 Iterrator를 얻은 다음 반복문, 주로 while문을 사용해서 컬렉션 클래스의 요소들을 읽어올 수 있다.


		// 모두 출력 0 ~ n-1 가 아님. 순서대로 데이터가 저장되어 있진 않다.
		
		// key값을 모두 취득 => iterator
		Iterator<Integer> it = hMap.keySet().iterator();
		
		while(it.hasNext()) {
			Integer key = it.next();
			System.out.println("key:" + key);
			
			String _value = hMap.get(key);
			System.out.println("value : " + _value);
		}
		
		

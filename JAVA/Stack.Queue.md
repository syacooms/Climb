Stack.Queue
===========================================================

	 	Stack : First In Last Out
	 			실린더에 공을 넣고 빼는 경우
	 			in -> Push
	 			out -> Pop
        
-----------------------------------------------------------
1. Stack과 Queue
-----------------------------------------------------------
* Stack은 마지막에 저장한 데이터를 가장 먼저 꺼내게 되는 LIFO(Last In First Out)구조로 되어있다.
* Queue는 처음에 저장한 데이터를 가장 먼저 꺼내게 되는 FIFO(First In Fisrt Out)구조로 되어있다.
> 스택은 동전통과 같은 구조로 양 옆과 바닥이 막혀 있어서 한 방향으로만 뺄 수 있는 구조.   
> 큐는 양 옆만 막혀 있고 위아래로 뚫려 있어서 한 방향으로는 넣고 한 방향으로는 배는 파이프와 같은 구조.

  	public static void main(String[] args) {
		Stack st = new Stack<String>();
		Queue q = new LinkedList<String>(); // 	Queue 인터페이스의 구현체인 LinkedList를 사용
		
		st.push("0");
		st.push("1");
		st.push("2");
		
		q.offer("0");
		q.offer("1");
		q.offer("2");
		
		System.out.println("= Stack =");
		while(!st.empty()) {
			System.out.println(st.pop()); // 스택에서 요소 하나를 꺼내서 출력
		}
		
		System.out.println("= Queue =");
		while(!q.isEmpty()) {
			System.out.println(q.poll()); // 큐에서 요소 하나를 꺼내서 출력
		}


	      }

    }
----------------------------
   
    //출력
    = Stack =
    2
    1
    0
    = Queue =
    0
    1
    2


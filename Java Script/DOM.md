
DOM ()
===========================================

* 텍스트 파일로 만들어져 있는 웹 문서를 브라우저에 렌더링하려면 웹 문서를 브라우저가 이해할 수 있는 구조로 메모리에 올려야 한다. 
* 브라우저의 렌더링 엔진은 웹 문서를 로드한 후, 파싱하여 웹 문서를 브라우저가 이해할 수 있는 구조로 구성하여 메모리에 적재하는데 이를 DOM이라 한다. 
* 즉 모든 요소와 요소의 어트리뷰트, 텍스트를 각각의 객체로 만들고 이들 객체를 부자 관계를 표현할 수 있는 트리 구조로 구성한 것이 DOM이다. 
* 이 DOM은 자바스크립트를 통해 동적으로 변경할 수 있으며 변경된 DOM은 렌더링에 반영된다.

![dom-tree](https://user-images.githubusercontent.com/31100061/87142964-51428c00-c2e0-11ea-872c-830d85008135.png)

* DOM에서 모든 요소, 어트리뷰트, 텍스트는 하나의 객체이며 Document 객체의 자식이다. 요소의 중첩관계는 객체의 트리로 구조화하여 부자관계를 표현한다. 
* DOM tree의 진입점(Entry point)는 document 객체이며 최종점은 요소의 텍스트를 나타내는 객체이다.


--------------------------------------------
CODE
-------------------------------------------
* document.getElementById(id) : id 어트리뷰트 값으로 요소 노드를 한 개 선택한다. 복수개가 선택된 경우, 첫번째 요소만 반환한다.
* childe Node : 자식 노드의 컬렉션을 반환한다. 텍스트 요소를 포함한 모든 자식 요소를 반환한다.


       <!DOCTYPE html>
       <html>
       <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        </head>
        <body>
	        <h3 id="intro">h3 tag id intro</h3>
	        <p id="demo">p tag id demo</p>
	
	    <button type="button" onclick="func()">버튼</button>
	
	      <script type="text/javascript">
	    function func() {
		    //let text = document.getElementById("intro").childNodes[0].nodeValue;
		    let text = document.getElementById("demo").childNodes[0].nodeValue;
		    alert(text);
	    }
	    </script>
      
-------------------------
CODE
-------------------------



   <!-- appendChild(뒤에 추가), insertChild(앞에 추가) -->
	  <div id="div1">
		  <p id="p1">첫번째 p태그</p>
		  <p id="p2">두번째 p태그</p>
  	</div>
	
	    <button type="button" onclick="appendfunc()">뒤에 추가</button>
	    <button type="button" onclick="insertfunc()">앞에 추가</button>
	    <button type="button" onclick="deletefunc()">삭제</button>
	
	    <script type="text/javascript">
	    function appendfunc() {
		    let ptag = document.createElement('p'); 	//<p></p>
		    let textNode = document.createTextNode("새로운 태그"); 
		
		    ptag.appendChild(textNode);	// <p>새로운 태그</p>
		
		    let element = document.getElementById("div1");
		    element.appendChild(ptag);
	    }
	
	    function insertfunc() {
		    let h3tag = document.createElement("h3");
		    let textNode = "새로운 h3 태그";
		
		    h3tag.appendChild(textNode);
		
		    let element = document.getElementById("div1");
		    let eleBefore = document.getElementById("p2");
		
		    element.insertBefore(h3tag, eleBefore);
	    }
	
	    function deletefunc() {
		    let element = document.getElementById("div1");
		    let removeEle = document.getElementById("p2");
		    element.removeChild(removeEle);
	    }
	    </script>

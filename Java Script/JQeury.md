JQeury
=================================================================

      Java Script : client(front)
              화면의 resource와 값을 결정, 취득하는 부분을 처리.
              DOM(getElementById, nodelist 등)
              Vue, react
      CSS(Cascading Style Sheet) : 디자인, front

      JQuery : Java Script 경량화, 간략화
          Ajax(비동기 통신)

      JQuery-UI : button, textField, slide

------------------------------------------------------------------

1.1 초기 설정 

------------------------------------------------------------------
* head 또는 body 부분에 Jquery 주소를 링크해야한다.
* 깜박하고 안쓰면 Uncaught ReferenceError: $ is not defined 에러가 뜬다..

        <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
       
       //주소1
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       //주소2
        <script src="http://code.jquery.com/jquery-3.5.1/jquery.min.js"></script>
        
        </head> 
        
-----------------------------------------------------------------
구문
-----------------------------------------------------------------
* 자바스크립트단에서 생성한다.


     $(this).hide("text");     -> this(자기자신)
     $("p").hide("text");      -> <p> 'tag'
     $(".demo").hide("text");	 -> id
     $("#demo").hide("text");	 -> class
 
 
-----------------------------------------------------------------

* 문서로드가 완료되기 전에 모든 jQuery 코드가 실행되지 않도록 하기위해 적어준다.(준비완료)
* 그 밑으로 jquery 메소드를 적어준다.


$(document).ready(function(){

  // jQuery methods go here...

});


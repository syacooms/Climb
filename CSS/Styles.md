CSS
===================================

* CSS Cascading Style Sheet	- Dream Weaver
* 문자의 컬러, 종류, 형태지정, 배경색 지정, 이미지 셋팅, 테두리 설정, 각종 Tag, id, class에 형태를 추가할 수 있다.

-----------------------------------
internal 방식 
-----------------------------------
* head 부분에 작성한다.

        <style type="text/css">
        /*
          태그명 또는 calss 또는 id{
            property 명: 값;
            property 명: 값;


          }
        */

        p{
          font-size: 14pt;
        }

        #p1{	/* # == id */
          color: red;
          font-size: 20pt;
        }

        .p2{	/*. == class */
          color: #0000ff;
          font-size: 24pt
        }
        p.p2{	/* p tag p2 class만 적용*/
          color: #ffff00;
        }

        </style>

-----------------------------------------
External 방식
-----------------------------------------
* link요소를 통한 외부의 CSS 파일을 HTML 페이지에 링크

        <link rel="stylesheet" type="text/css" href="./style.css">

        </head>

-----------------------------------------
Inline 방식
-----------------------------------------
* 적용하고 싶은 스타일을 태그내에 적용하는 방법

        <body>

        <p>p tag 입니다.</p>

        <!-- attribute property -->
        <p style="font-size: 10pt">p tag 글자크기는 10 point입니다</p>



        <h3>h3 tag 입니다</h3>

        <p id="p1">p tag id p1</p>

        <h3 id="p1">h3 tag id p1</h3>

        <p class= "p2">p tag class p2</p>

        <H3 class="p2">h3 tag class p2</H3>



        </body>
        </html>

Asynchronous JavaScript and XML
==================================

![traditional-webpage-lifecycle](https://user-images.githubusercontent.com/31100061/88378257-9cc66100-cddb-11ea-92ba-dfe8066581c1.png)


* Ajax(Asynchronous JavaScript and XML)는 자바스크립트를 이용해서 비동기적(Asynchronous)으로 서버와 브라우저가 데이터를 교환할 수 있는 통신 방식을 의미한다.
* 서버로부터 웹페이지가 반환되면 화면 전체를 갱신해야 하는데 페이지 일부만을 갱신하고도 동일한 효과를 볼 수 있도록 하는 것이 Ajax이다. 
* 페이지 전체를 로드하여 렌더링할 필요가 없고 갱신이 필요한 일부만 로드하여 갱신하면 되므로 빠른 퍼포먼스와 부드러운 화면 표시 효과를 기대할 수 있다.


----------------------------------
CODE! - index.html
----------------------------------

         <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        </head>
        <body>
        <p id="demo"></p>
        <br>
        <input type="text" id="id">
        <button type= "button">click</button>

        <script type="text/javascript">
        $(function () {
          $("button").click(function () {

            $.ajax({
              url:"custuser",
              type:"get",
            //	data:"id=abc&pwd=123",
              data:{ id:$("#id").val() , pwd:"123"},
              success:function( json ){
              //	alert("success");

              //	alert( json.str );

              //	alert( json.map.title );

                let custlist = json.map.custlist;
                alert( custlist[0].id );
                alert( custlist[0].name );
              },
              error:function(){
                alert("error");
              }


            });
          });
        });
        </script>
        </body>
        </html>
 
*  $.ajax JQuery 형식으로 시작한다. 물론 JavaScript로도 작성이 가능하다.
* url - type (get or post방식을 선택) - data (넘겨줄 데이터)
* *success* -> json으로 넘겨받아 값을 확인하고 넘겨주는 함수
* error -> error일 경우 alert값을 출력
* ~dto CODE는 ID와 NAME값만 넘겨주므로 생략~

----------------------------------
CODE! - CustUserServlet
----------------------------------
      package cust;

      import java.io.IOException;
      import java.util.ArrayList;
      import java.util.HashMap;
      import java.util.List;

      import javax.servlet.ServletException;
      import javax.servlet.annotation.WebServlet;
      import javax.servlet.http.HttpServlet;
      import javax.servlet.http.HttpServletRequest;
      import javax.servlet.http.HttpServletResponse;

      import dto.CustUserDto;
      import net.sf.json.JSONObject;
      //얘는 지금 데이터를 가지고 오는 용도로만 사용함.
      //현재 자기자신의 위치를 고수하면서 데이터만 던져줌.
      @WebServlet("/custuser")
      public class CustUserServlet extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //	System.out.println("CustUserServlet doGet");
          String id = req.getParameter("id");
          String pwd = req.getParameter("pwd");
          System.out.println(id + " " + pwd);

          // 전송 Data
        //	HashMap<String, Object> map = new HashMap<String, Object>();
        //	map.put("title", "사과");			// String 전송

          // Object로 변환하는 2번째 절차
          JSONObject jobj = new JSONObject();
        /*	jobj.put("str", "Hello");
          jobj.put("map", map);			// HashMap 전송
        */	

          // list에 데이터를 저장
          List<CustUserDto> list = new ArrayList<CustUserDto>();
          list.add(new CustUserDto("aaa",	"홍길동", "서울시"));
          list.add(new CustUserDto("bbb",	"일지매", "부산시"));

          // HashMap에 list를 저장
          HashMap<String, Object> map = new HashMap<String, Object>();
          map.put("custlist", list);

          // 전송할 데이터를 추가
          jobj.put("map", map);


          resp.setContentType("application/x-json; charset=UTF-8");
          resp.getWriter().print(jobj);



        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          System.out.println("CustUserServlet doPost");
        }


      }


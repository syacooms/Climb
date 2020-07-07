Form1
================================================
* resource들을 활용하여 JSP로 데이터를 받아보기.

    <!-- form 
	    resource
	    textfield, button, textArea, Checkbox, radio button
    -->

    <!--
	    Attribute
		    목적   :	접근하기 위한 요소(element)
	    id 		:	현재 페이지에서 1개만 적용된다. Java Script
	    class   :	다중으로 사용이 가능하다. CSS, Java Script
	    name 	:	값을 전달. 1개만 사용
  
    <p id="aaa" class="ddd" name="a1">hello</p>
    <p id="bbb" class="ddd" name="b1">hello</p>
    <p id="ccc" class="ddd" name="c1">hello</p>
    -->
-------------------------------------------------
Id & Pw
================================================

![re-01](https://user-images.githubusercontent.com/31100061/86737343-2f8e9e00-c06f-11ea-87e2-79ced15d35d4.jpg)

    <a href="NewFile.jsp">NewFile로 이동</a>	
    <br>

    <form action="NewFile.jsp">
    ID:<input type="text" name="id" value="" title="여기에 id 기입">
    <br>
    Password:<input type="password" name="pwd" value="">
    <br>
    <input type="submit" value="버튼"> 
    <br>
    <input type="reset" value="초기화">

    </form>
    <br><br><br>

    <!-- HTML5 -->
    <form action="NewFile1.jsp">
    number:<input type="number" name="number" max="5" min="0">
    <br>
    date:<input type="date" name="date">
    <br>
    color:<input type="color" name="color" value="#ff0000"> <!-- <-- 초기값 -->
    <br>
    range:<input type="range" name="range" max="10" min="0">
    <br>
    search:<input type="serarch" name="search">

    <br>
    <input type="submit" value="넘겨라아ㅏㅏㅏㅏㅏㅏ">
    </form>

-------------------------------
NewFile.jsp
===============================
    <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    </head>
    <body>

    <h3>NewFile.jsp</h3>

    <%--
    	Java Server Page = html + java 
     --%>
 
    <%
    // Java 영역
    // -> Dao(Singleton) 호출
    String id = request.getParameter("id");
    System.out.println("id:" + id);

    String pwd = request.getParameter("pwd");
    System.out.println("password:" + pwd);
%> 

--------------------------------------------
Input Type & Check Box & Radio Button
============================================
![re-02](https://user-images.githubusercontent.com/31100061/86737351-30bfcb00-c06f-11ea-832c-28caa4350421.jpg)

    <form action="NewFile1.jsp">
    number:<input type="number" name="number" max="5" min="0">
    <br>
    date:<input type="date" name="date">
    <br>
    color:<input type="color" name="color" value="#ff0000"> <!-- <-- 초기값 -->
    <br>
    range:<input type="range" name="range" max="10" min="0">
    <br>
    search:<input type="serarch" name="search">

    <br>
    <input type="submit" value="넘겨라아ㅏㅏㅏㅏㅏㅏ">
    </form>
    <br><br><br>

    Check Box & Radio Button<br>
	   <form action="NewFile1.jsp">
	  <input type="checkbox" name="hobby" value="패션">패션<br>
	  <input type="checkbox" name="hobby" value="음악">음악<br>
	  <input type="checkbox" name="hobby" value="게임">게임<br>
	  <br>
	  <input type="radio" name="car" value="벤츠" checked="checked">벤츠<br>
  	<input type="radio" name="car"  value="아우디">아우디<br>
  	<input type="radio" name="car"  value="BMW">BMW<br>
	  <br>

	  <input type="submit" value="취미">
  </form>

-----------------------------------------
NewFile1.jsp
=========================================
      <%@ page language="java" contentType="text/html; charset=UTF-8"
    	  pageEncoding="UTF-8"%>
    <%
    //String ho = request.getParameter("hobby");
    //System.out.println("hobby:" + ho);

        String ho[] = request.getParameterValues("hobby");

      if(ho != null && ho.length > 0){
    	for(int i=0; i<ho.length; i++){
    		System.out.println(ho[i]);
    	}
    }

    String number = request.getParameter("number");
    System.out.println("number:" + number);

    String date = request.getParameter("date");
    System.out.println("date:" + date);

    String color = request.getParameter("color");
    System.out.println("color :" + color);

    String range = request.getParameter("range");
    System.out.println("range :" + range);

    String search = request.getParameter("search");
    System.out.println("search :" + search);

    String car = request.getParameter("car");
    System.out.println("car:" + car);

    %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    </head>
    <body>

    </body>
    </html>

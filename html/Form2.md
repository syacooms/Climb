Select & TextArea & video
==================================

![3-3](https://user-images.githubusercontent.com/31100061/86734993-6368c400-c06d-11ea-8099-5c19239d8926.jpg)


    Select == Choice == ComboBox
    <form action="NewFile3.jsp">
    <select name= "fname" multiple="nultiple">
	    <option value="사과">Apple</option>
	    <option value="배">Pear</option>
	    <option value="바나나" selected ="selected">Banana</option>
	    <option value="포도">Grape</option>
    </select>
    <input type = "submit" value="과일">
    </form>

    <br>

    <textarea rows="10" cols="30">초기값</textarea>

    <video width="400" controls="controls">
		    <source src="mov_bbb.mp4" type="video/mp4">
		    <!-- <source src="mov_bbb.ogg" type="video/mp4"> -->
    </video>
	

    </body>
    </html>
    
------------------------------------------------------------
NewFile3.jsp
============================================================
* Select의 경우 다중으로 입력을 넘겨받을 수 있다.

        <%@ page language="java" contentType="text/html; charset=UTF-8"
            pageEncoding="UTF-8"%>
    
        <%
        // Scriptlet
        //String fname = request.getParameter("fname");
       //System.out.println("선택 과일:" + fname);

        String fArr[] = request.getParameterValues("fname");
        for(int i = 0; i < fArr.length; i++) {
	        System.out.println(fArr[i]);
        }

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

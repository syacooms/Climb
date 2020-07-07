Table2
======================
* caption : 제목
* colspan : 행 합치기
* rowspan : 열 합치기



![셀 합치기](https://user-images.githubusercontent.com/31100061/86728069-09fd9680-c067-11ea-9645-05c832d23d40.jpg)

    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    </head>
    <body>

    <div align="center">
    <table border="1" style="width: 800px; height: 100%">
    <caption>셀 합치기</caption>
    <tr>
	  <td colspan="2">1</td>
	  <!-- <td>2</td> -->
    </tr>
    <tr>
	    <td>1</td>
	    <td>2</td>
    </tr>
    <tr>
	     <td>1</td>
	     <td>2</td>
    </tr>
    <tr>
	    <td rowspan = "2">11</td>
	    <td>2</td>
    </tr>
    <tr>
	    <!-- <td>11</td> -->	
	    <td>2</td>
    </tr>
    </table>
    </div>
    </body>
    </html>


-----------------
* iframe : webpage 안에 webpage


![iframe 주소 불러오기](https://user-images.githubusercontent.com/31100061/86728072-0bc75a00-c067-11ea-82a6-598dabba3a28.jpg)



    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    </head>
    <body>
    <!-- iframe : 웹페이지 안에 웹페이지 -->
    <h3>Table2</h3>
    <iframe src="https://www.cgv.co.kr/" width="300" height="300"></iframe>
    <iframe src="index.html" width="300" height="300"></iframe>
    </body>
    </html>

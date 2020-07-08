Function

===========================================
* document.getElementBy~() 자주쓰는 함수사용 예제.
* id , name , class 값을 이용하여 <input type="text" id="inputdemo" value=""> 형식 등의 밸류값을 불러올 수 있다.(버튼또한 마찬가지)
* 본 예제는 값을 입력해주면 p 태그에 입력한 값이 나타나고 text 창에 입력한 값의 +2가 된 값을 출력해준다.
* getter setter의 형식과 비슷하다.




    
    ![123](https://user-images.githubusercontent.com/31100061/86903827-d300b100-c14a-11ea-96d7-e17793d00365.jpg)

    
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        </head>
        <body>

        <h3 id="h3demo">h3 tag id h3demo</h3>
        <br><br>

        <p id="pdemo">p tag id pdemo</p>
        <br><br>

        입력:<input type="text" id="inputdemo" value="">
        <br><br>

        <button type="button" onclick="btnclick()">클릭</button>

        <script type="text/javascript">
        function btnclick(){
    
	
    	let str = document.getElementById('inputdemo').value; //get
    	document.getElementById('pdemo').innerHTML = str;	 //set
	
    	document.getElementById('inputdemo').value = parseInt(str) + 2 //set

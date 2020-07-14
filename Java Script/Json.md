JavaScript Object Notation
==================================

* Json은 데이터를 저장하고 교환하기 위한 표기법.
* JSON은 JavaScript 객체 표기법으로 작성된 텍스트.
   
   
       </head>
        <body>
        <p id="demo"></p>

        <script type="text/javascript">

        let xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function() {
          if(this.readyState == 4 && this.status == 200){
            jsonFunc( xhttp.responseText );
          }
        }
        xhttp.open("GET", "jsondata.json", true);
        xhttp.send();

>> xml 형식의 parshing(원하는 데이터 취득)
-------------------------------------------
* JSON.parse() --> String을 json 형식으로 변환한다.
* 파싱한 respone 값을 txt에 담아 id="demo"인 태그에 반환하는 코드

        function jsonFunc( resp ){


          let arr = JSON.parse(resp);


          for (var i = 0; i < arr.length; i++) {
            txt += arr[i].name + " " +
                arr[i].age + " " +
                arr[i].address + " " +
                arr[i].tel + "<br>";
          }

          document.getElementById("demo").innerHTML = txt;

        }


        </script>
        </body>
        </html>

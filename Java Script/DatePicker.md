JQuery-UI
=======================================================================
* JQuery-UI의 위젯을 활용(달력) -> datepicker()
     
     
     
     
     <!DOCTYPE html>
      <html>
      <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

      <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
      </head>
      <body>
  
      <h1>Jquery-ui 달력</h1>
      <h2>date picker</h2>

      선택일:<input type="text" id="date">
      <br><br>

      연도:<input type="text" id="year"><br>
      월:<input type="text" id="month"><br>
      일:<input type="text" id="day"><br>
      요일:<input type="text" id="week">

      <p>text박스를 선택하면, 달력이 표시 됩니다</p>
      <script type="text/javascript">
      $(function () {

        let week = ['일', '월', '화', '수', '목', '금', '토'];

        $("#date").datepicker({
          dateFormat: "yy/mm/dd",
          dayNamesMin: week,
          monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월'],
          onSelect: function ( d ) {
          //	alert(d);

            let arr = d.split('/');

            $("#year").val( arr[0].trim() );
            $("#month").val( arr[1] );
            $("#day").val( arr[2] );

            // 요일
            let weekday = new Date( $("#date").datepicker({ dateFormat: "yy/mm/dd"}).val() );
      //			alert(weekday.getDay());

            $("#week").val( week[ weekday.getDay() ] );
          }
        });

      });
      </script>

      </body>
      </html>

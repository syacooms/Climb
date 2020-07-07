
 Table
 ===========================================================
 
 * table border = "" : 테두리
 * tr : 행
 * td : 셀
 * th : 해당 테이블의 헤더 셀 (제목 셀)
 
 
 
 ![col 예제1](https://user-images.githubusercontent.com/31100061/86701773-48865780-c04d-11ea-8f11-aaec4ee5c0f9.jpg)


    <table border="1">
	  <col width="50"><col width="100"><col width="200"><col width="50">
	  <tr>
	  <th>번호</th><th>성</th><th>이름</th><th>나이</th>
	  </tr>
	  <tr>
		<th>1</th><td align="center">홍</td><td>길동</td><td>24</td>
	  </tr>
	  <tr>
		<th>2</th><td align="center">더블</td><td>배럴</td><td>999</td>
	  </tr>
	  <tr>
		<th>3</th><td align="center">변</td><td>사또</td><td>30</td>
	  </tr>
    </table>



![col 예제2](https://user-images.githubusercontent.com/31100061/86692075-69967a80-c044-11ea-90c7-492a4fa8995e.jpg)

		
	  </tr>
	  <tr>
		<td>홍</td>
		<td>길동</td>
		<td>24</td>
		<td>123-4567</td>
		<td>234-5678</td>
		<td>345-6789</td>
	  </tr>
    </table>



![col 에제3](https://user-images.githubusercontent.com/31100061/86691995-5388ba00-c044-11ea-816a-4e0852596881.jpg)

    <div align="right">
    <table border="1">
	  <caption>주소록</caption>
	  <tr>
		<th>번호</th>
		<td>1</td>
	  </tr>
	  <tr>
		<th>성</th>
		<td>홍</td>
	  </tr>
	  <tr>
		<th>이름</th>
		<td>길동</td>
	  </tr>
	  <tr>
		<th rowspan="2">전화번호</th>
		<td>123-4567</td>
	  </tr>
	  <tr>
		<!-- <th>전화번호</th> -->
		<td>234-5678</td>
	  </tr>
    </table>
    </div>	

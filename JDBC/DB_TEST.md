DATABASE_TEST
=============================================
* JSP 들어가기전 JDBC와 DATABASE 연동
* 테이블 값은 자바 영역에서 틀은 HTML 
* JSP에서 좀 더 자세하게 들어간다고함 ~아..~
         
         
         
            <%@page import="java.sql.ResultSetMetaData"%>
            <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.PreparedStatement"%>
            <%@page import="java.sql.DriverManager"%>
            <%@page import="java.sql.Connection"%>
            <%@ page language="java" contentType="text/html; charset=UTF-8"
                pageEncoding="UTF-8"%>
            <!DOCTYPE html>
            <html>
            <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            </head>
            <body>

            <h1>HR Tables</h1>

            <p>모든 테이블을 출력</p>

            <%
            // java 영역
            Class.forName("oracle.jdbc.driver.OracleDriver");

            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String user = "hr";
            String password = "hr";

            Connection conn = DriverManager.getConnection(url, user, password);

            String sql = "SELECT * FROM TAB";
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();

            ResultSetMetaData rsmd = rs.getMetaData(); // column 정보
            int count = rsmd.getColumnCount(); 		   // column 갯수
            %>

            <table border="1">
              <tr>
                <% 
                for(int i = 1; i < count + 1; i++){
                %>
                  <th><%=rsmd.getColumnName(i)%></th>
                <% 
                }
                %>
              </tr>

            <%
            while(rs.next()){
            %>
              <tr>
                <% 
                for(int i = 1; i < count + 1; i++){
                  String cols = rs.getString(i);
                %>
                <td><%=cols %></td>

                <% 	
                }
                %>	
              </tr>
            <% 	
            }
            %>
            </table>
            </body>
            </html>
            
            
-----------------------------------------------------


![주석 2020-07-21 174633](https://user-images.githubusercontent.com/31100061/88033343-38589700-cb7a-11ea-8d64-b0ce31b6becd.jpg)



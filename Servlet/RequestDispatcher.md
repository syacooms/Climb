RequestDispatcher
=======================================

* RequestDispatcher는 클라이언트로부터 최초에 들어온 요청을 JSP/Servlet 내에서 원하는 자원으로 요청을 넘기는(보내는) 역할을 수행하거나, 특정 자원에 처리를 요청하고 처리 결과를 얻어오는 기능을 수행하는 클래스입니다. 
* 즉 /a.jsp 로 들어온 요청을 /a.jsp 내에서 RequestDispatcher를 사용하여 b.jsp로 요청을 보낼 수 있습니다. 또는 a.jsp에서 b.jsp로 처리를 요청하고 b.jsp에서 처리한 결과 내용을 a.jsp의 결과에 포함시킬 수 있습니다.




----------------------------------------

![99C2234A5B6B13CD32](https://user-images.githubusercontent.com/31100061/87910821-9b2c2e80-caa5-11ea-9a4f-9d316c52f30a.png)


    resp.sendRedirect("result");
    
  * sendRedirect()는 하나의 요청 범위 안에서 처리를 하는것이 아니라 브라우저에게 Response 후 브라우저측에서 지정받은 요청 경로로 다시 재요청을 하는 방식
  * 서버측에서는 최초에 받은 요청중에 처리한 내용을 리다이렉트 된 요청안에서 공유할 수 없는 문제가 있습니다.
  
  
 

--------------------------------------------------------------------------------------------

* 서블릿 클래스에서는 service() 메서드나 doGet() doPost() 등에서 ServletRequest의 하위 클래스인 HttpServletRequest를 매개변수로 받기 때문에 이것을 이용하여 RequestDispatcher를 얻을 수 있습니다. 
* HttpServletRequest에서는 URL 경로를 통해서 대상을 지정하는 한가지 방법만을 제공합니다.
* getRequestDispatcher() 밸류값은 WEB-INF/ xml 파일에서 작성한 서블릿 매핑한 URL를 적어줄 수 있도록 합니다.

      //	RequestDispatcher dispatch = req.getRequestDispatcher("result");
      //	dispatch.forward(req, resp);
      // 결합하여 한줄로 나타낼 수 있습니다.
      req.getRequestDispatcher("result").forward(req, resp);
      
------------------------------------------------------------------------------------------------
 RequestDispatcher안의 forward()
================================================================================================


![99050C335B6B08E81D](https://user-images.githubusercontent.com/31100061/87912856-0dead900-caa9-11ea-92f3-d108132d036f.png)


          dispatch.forward(req, resp);
 
* forward() 메서드는 대상 자원으로 제어를 넘기는 역할을 합니다. 브라우저에서 /a.jsp로 요청했을 때 /a.jsp에서 forward()를 실행하여 /b.jsp로 제어를 넘길 수 있습니다.
* 제어를 넘겨받은 /b.jsp는 처리 결과를 최종적으로 브라우저에게 출력합니다. 브라우저 입장에서는 /a.jsp를 요청했지만 받은 결과는 /b.jsp의 결과입니다.
* 이때 HTTP 리다이렉트 방식과는 달리 하나의 HTTP 요청(Request) 범위 안에서 동작이 이루어집니다.

  
          ObjectDto dto = new ObjectDto(name, age, fruits);
          req.setAttribute("myfruit", dto);

 * a.jsp에서 client에서 넘어온 결과를 setAttribute 형식으로 담아 사용할 수 있게 합니다. (*dto 작성*)
 * a.jsp -> b.jsp (또는 Servlet)으로 getAttribute로 불러오기 위해서 담아둡니다. (*foward() 메소드를 사용하기 위한 초석*)
 
          
          ObjectDto dto = (ObjectDto)req.getAttribute("myfruit");
		      System.out.println(dto.toString());
 
 * b.jsp에서 a.jsp에서 넘어온 결과를 getAttribute()로 불러옵니다.
 * dto를 따로 작성했으므로 getName() , getAge() 등 getter를 통해 값을 받아오고 출력해줍니다.

------------------------------------------------------------------------------------------------
CODE
=========================
index.html
-------------------------
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        </head>
        <body>

        <h1>앙케이트 조사입니다</h1>

        <form action="hello" id="frm" method="get">

        <table>
        <tr>
          <td>이름</td>
          <td>
            <input type="text" name="name" size="20" value="홍길동">
          </td>
        </tr>
        <tr>
          <td>나이</td>
          <td>
            <input type="text" name="age" value="25">
          </td>
        </tr>
        <tr>
          <td>좋아하는 과일</td>
          <td>
            <select name="fruit" multiple="multiple">
              <option value="apple" selected="selected">사과</option>
              <option value="pear">배</option>
              <option value="banana">바나나</option>
            </select>
          </td>
        </tr>

        </table>

        <button type="button" id="btn">송신</button>

        </form>

        <script type="text/javascript">
        $(document).ready(function () {

          $("#btn").click(function () {

            $("#frm").submit();

          });

        });
        </script>


        </body>
        </html>

-------------------------
WEB.XML
-------------------------

      <?xml version="1.0" encoding="UTF-8"?>
    <web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
      <display-name>sample06</display-name>
      <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>default.html</welcome-file>
        <welcome-file>default.htm</welcome-file>
        <welcome-file>default.jsp</welcome-file>
      </welcome-file-list>


    <servlet>
      <servlet-name>hello</servlet-name>
      <servlet-class>sample06.HelloServlet</servlet-class>
    </servlet>  

    <servlet-mapping>
      <servlet-name>hello</servlet-name>
      <url-pattern>/hello</url-pattern>
    </servlet-mapping>  

    <servlet>
      <servlet-name>result</servlet-name>
      <servlet-class>sample06.ResultServlet</servlet-class>	
    </servlet>

    <servlet-mapping>
      <servlet-name>result</servlet-name>
      <url-pattern>/result</url-pattern>
    </servlet-mapping>

    </web-app>

-------------------------
ObjectDto.java (*dto*)
-------------------------
        package dto;

        import java.io.Serializable;

        import org.apache.catalina.tribes.util.Arrays;

        public class ObjectDto implements Serializable {

          private String name;
          private int age;
          private String fluit[];

          public ObjectDto() {
          }

          public ObjectDto(String name, int age, String[] fluit) {
            super();
            this.name = name;
            this.age = age;
            this.fluit = fluit;
          }

          public String getName() {
            return name;
          }

          public void setName(String name) {
            this.name = name;
          }

          public int getAge() {
            return age;
          }

          public void setAge(int age) {
            this.age = age;
          }

          public String[] getFluit() {
            return fluit;
          }

          public void setFluit(String[] fluit) {
            this.fluit = fluit;
          }

          @Override
          public String toString() {
            return "ObjectDto [name=" + name + ", age=" + age + ", fluit=" + Arrays.toString(fluit) + "]";
          }
        }
        
-------------------------
HelloServlet(*a.jsp*)
-------------------------
        package sample06;

        import java.io.IOException;

        import javax.servlet.RequestDispatcher;
        import javax.servlet.ServletException;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;

        import dto.ObjectDto;

        public class HelloServlet extends HttpServlet {

          @Override
          protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String name = req.getParameter("name");
            String sAge = req.getParameter("age");

            System.out.println("name:" + name);
            System.out.println("age:" + sAge);

            int age = 0;
            if(sAge == null || sAge.trim().equals("")) {
              resp.sendRedirect("index.html");
            }else {
              age = Integer.parseInt(sAge);
            }

            String fruits[] = req.getParameterValues("fruit");
            for (int i = 0; i < fruits.length; i++) {
              System.out.println(fruits[i]);
            }

            // servlet(java) -> servlet(java)
            // servlet(java) -> jsp

            // ResultServlet으로 이동
          //	resp.sendRedirect("result");


            // 데이터 모으기
            ObjectDto dto = new ObjectDto(name, age, fruits);

            // 짐싸!
            req.setAttribute("myfruit", dto);

          //	RequestDispatcher dispatch = req.getRequestDispatcher("result");
          //	dispatch.forward(req, resp);

            // 잘가
            req.getRequestDispatcher("result").forward(req, resp);

          //	resp.sendRedirect("result?name=" + name + "&age=" + age + "&fruit=" + fruits[0]);		
          }

          @Override
          protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

          }


        }
        

-------------------------
ResultServlet(*b.jsp*)
-------------------------
        package sample06;

        import java.io.IOException;
        import java.io.PrintWriter;

        import javax.servlet.ServletException;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;

        import dto.ObjectDto;

        public class ResultServlet extends HttpServlet {

          @Override
          protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            ObjectDto dto = (ObjectDto)req.getAttribute("myfruit");

            System.out.println(dto.toString());

            resp.setContentType("text/html; charset=utf-8");

            PrintWriter pw = resp.getWriter();

            pw.println("<html>");
            pw.println("<head>");
            pw.println("<title>제목</title>");
            pw.println("</head>");

            pw.println("<body>");

            pw.println("<h1>Hello Result</h1>");	

            pw.println("이름:<input type='text' value=" + dto.getName() + ">");
            pw.println("나이:<input type='text' value=" + dto.getAge() + ">");

            String fruits[] = dto.getFluit();
            for (int i = 0; i < dto.getFluit().length; i++) {			
              pw.println("<p>" + fruits[i] + "</p>");
            }

            pw.println("</body>");

            pw.println("</html>");		

            pw.close();


          }

          @Override
          protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

          }


        }



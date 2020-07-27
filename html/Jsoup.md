Java HTML Parser
------------------------------------------

* jsoup은 자바(Java)로 만들어진 HTML 파서(Parser) 이다.
* jsoup을 사용하려면 library에 넣을 파일이 필요하다. <a href="https://jsoup.org/download"> <다운로드 링크> </a>


------------------------------------------
CODE : MovieManager.java
------------------------------------------
* 파싱한 데이터를 담아주기 위한 클래스

        package movie;

        import java.io.IOException;
        import java.util.ArrayList;
        import java.util.List;

        import org.jsoup.Jsoup;
        import org.jsoup.nodes.Document;
        import org.jsoup.nodes.Element;
        import org.jsoup.select.Elements;

        import dto.MovieVo;

        public class MovieManager {

          public static List<MovieVo> getCGVdata() {
              Document doc;
		List<MovieVo> list = new ArrayList<MovieVo>();
		
		try {
    
-------------------------------------------------------------------------  

			doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			
			// 영화제목
			Elements titles = doc.select("div.box-contents strong.title");
					
			
			// 골든에그지수(좋아요) %
			Elements likes = doc.select("div.box-contents span.percent");
      
 * url로부터 호출하는 방법 . get방식의 호출을 한다.
 * doc.select를 통해 css 스타일로 요소 선택이 가능하다. *띄어쓰기 주의할 것*
-------------------------------------------------------------------------			
			
					for (int i = 0; i < 7; i++) {
						Element eTitle = titles.get(i);
						String title = eTitle.text();
						System.out.print(title + " ");
						
						Element eLike = likes.get(i);
						String like = eLike.text().replace("%", "");
						System.out.println(like);
						
						MovieVo vo = new MovieVo(title, Integer.parseInt(like));
						
						list.add(vo);
					}
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
          }

          return list;
        }

---------------------------------------------------------------------
CODE : MovieVo
---------------------------------------------------------------------
* DTO

        package dto;

        import java.io.Serializable;

        public class MovieVo implements Serializable {
          private String title;
          private int like;

          public MovieVo() {
          }

          public MovieVo(String title, int like) {
            super();
            this.title = title;
            this.like = like;
          }

          public String getTitle() {
            return title;
          }

          public void setTitle(String title) {
            this.title = title;
          }

          public int getLike() {
            return like;
          }

          public void setLike(int like) {
            this.like = like;
          }

          @Override
          public String toString() {
            return "MovieVo [title=" + title + ", like=" + like + "]";
          }


        }
        
----------------------------------------------------------
CODE : index.jsp
----------------------------------------------------------

* 크롤링한 데이터를 작성한다. <a href ="https://www.highcharts.com/demo/pie-basic">크롤링 링크</a>
* list를 json의 형태로 바꿔준다. { key : value }
 

        <%@page import="movie.MovieManager"%>
        <%@page import="dto.MovieVo"%>
        <%@page import="java.util.List"%>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
            pageEncoding="UTF-8"%>


        <%
        List<MovieVo> list = MovieManager.getCGVdata();

        for(int i = 0; i< list.size(); i++){
          System.out.println(list.get(i).toString());
        }

        // list -> json
        String jsonlike = "[";

        for(MovieVo m : list){
        //	System.out.println(m);
          jsonlike += "{ name: '" + m.getTitle() + "', y:" + m.getLike() + "}, ";
        }

        jsonlike = jsonlike.substring(0, jsonlike.lastIndexOf(","));

        jsonlike += "]";

        System.out.println(jsonlike);

        request.setAttribute("jsonlike", jsonlike);

        %>
        
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
        <script src="https://code.highcharts.com/modules/accessibility.js"></script>

        <style type="text/css" rel="stylesheet">
        .highcharts-figure, .highcharts-data-table table {
          min-width: 320px; 
          max-width: 800px;
          margin: 1em auto;
        }

        .highcharts-data-table table {
          font-family: Verdana, sans-serif;
          border-collapse: collapse;
          border: 1px solid #EBEBEB;
          margin: 10px auto;
          text-align: center;
          width: 100%;
          max-width: 500px;
        }
        .highcharts-data-table caption {
          padding: 1em 0;
          font-size: 1.2em;
          color: #555;
        }
        .highcharts-data-table th {
          font-weight: 600;
          padding: 0.5em;
        }
        .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
          padding: 0.5em;
        }
        .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
          background: #f8f8f8;
        }
        .highcharts-data-table tr:hover {
          background: #f1f7ff;
        }


        input[type="number"] {
          min-width: 50px;
        }

        </style>

        </head>
        <body>

        <figure class="highcharts-figure">
          <div id="container"></div>
        </figure>

        <script type="text/javascript">



        Highcharts.chart('container', {
            chart: {
              plotBackgroundColor: null,
              plotBorderWidth: null,
              plotShadow: false,
              type: 'pie'
            },
            title: {
              text: '영화가 좋아요'
            },
            tooltip: {
              pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            accessibility: {
              point: {
                valueSuffix: '%'
              }
            },
            plotOptions: {
              pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                  enabled: true,
                  format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
              }
            },
            series: [{
              name: 'Brands',
              colorByPoint: true,
              data: <%= request.getAttribute("jsonlike") %>

            }]
          });
        </script>

        </body>
        </html>

----------------------------------------------
CODE : mainClass.java
----------------------------------------------
        package main;

        import movie.MovieManager;

        public class mainClass {

          public static void main(String[] args) {

            MovieManager.getCGVdata();
          }

        }
---------------------------------------------
![주석 2020-07-27 183642](https://user-images.githubusercontent.com/31100061/88527408-2d00e200-d038-11ea-83c7-71eba041db81.jpg)


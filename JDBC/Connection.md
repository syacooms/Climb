
DBConnection.Class
=============================   


    public class DBConnection {
	   public static void initConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			System.out.println("Driver Loading Success");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
   
	public static Connection getConnection() {
		
		Connection conn = null;
		// 연결
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.7.72:1521:xe", "hr", "hr");
			
			System.out.println("Oracle Connection Success!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	  }
    }
  
  
 * Class.forName() 을 이용해서 드라이버 로드하는 initConnection() 메소드. 
 * getConnection() 을 이용해서 URI와 SQL Developer의 hr의 id와 pasword. 연결해준다고 생각하면 편함.
 
 ----------------------------------------------
 DBClose.Class
 ==============================================
 
    public class DBClose {													
	  public static void close(Statement stmt , Connection conn, ResultSet rs) {
			try {
				if(stmt != null) {
				stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				if(rs != null) {	// Select
					rs.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	    }
      }
  
  * DBClose,DBConnection 클래스는 어떤 Query 함수를 적용하던간에 공통적인 값이 적용됨. 그래서 메소드가 전부 static임.
  * close 메소드는 변수들이 null 이외의 값을 얻으면 닫아주는 역할을 함.
-----------------------------------------------
Dto Class
===============================================
  
    public class UserDto implements Serializable {
	  private String id;
	  private String name;
	  private int age;
	  // ****주의 DATE는 String
	private String joindate;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}
	public UserDto(String id, String name, int age, String joindate) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.joindate = joindate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "UserDto [id=" + id + ", name=" + name + ", age=" + age + ", joindate=" + joindate + "]";
	}
    }
 
 * DB 조작 및 담당하는 Class (setter getter Override constructor)
------------------------------------------------------------------
 SelectTest.Class
 =================================================================
 * Select의 대한 쿼리문만 정리함. 다른 쿼리문은 int 값으로 반환만 하면 되는데 Select는 콘솔창으로 DB의 결과를 가져와야하니까 더 복잡해서임.
 * 예제는 3개로 기본/ 쿼리문 "?" 퀘스쳔 적용 / 다중 DATA값의 취득
      
 -----------------------------------------------------------------
    // 1개의 Data 취득
    public class SelectTest {
      public UserDto search(String id) {
      String sql = " SELECT ID, NAME, AGE, JOINDATE "
					+ " FROM USERTEST "
					+ " WHERE ID = '" + id + "' ";
		  System.out.println("sql:" + sql);
		
		Connection conn = DBConnection.getConnection();
		Statement stmt = null;		
		ResultSet rs = null;	// DB로부터 결과를 return
		
		UserDto dto = null;
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {	// 데이터가 있는 경우
				String _id = rs.getString("id"); //getString(columnlabel) column 명은 db의 것
				String _name = rs.getString("name");
				int _age = rs.getInt("age");
				String _joindate = rs.getString("joindate");
				
				// data가 없으면 null로 리턴 >> dto = null; 위 참고
				dto = new UserDto(_id, _name, _age, _joindate);				
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(stmt, conn, rs);			
		}
		
		return dto;
	  }	
	
* statement       :  구문을 실행할 객체를 만듦. 클래스
* executeQuery()  :  객체의 값을 반환함. sql 텍스트를 넣는다고 생각. 

-------------------------------------------------------------------------
    
    // 조건문 ? 적용
	  public UserDto Select(String id) {
		String sql = " SELECT ID, NAME, AGE, JOINDATE "
					+ " FROM USERTEST "
					+ " WHERE ID = ? ";
		
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		UserDto dto = null;
		
		try {
			//쿼리문이 완성되는 시점
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);	// Query에서 ? 부분에 해당하는 Data
									//psmt.setString(위치, index값);
			
			rs = psmt.executeQuery();
      
* search 메소드와 달리 psmt.setString(1, id);을 통해 직접. ? 부분에 해당하는 Data를 할당 할 수 있다.
* prepareStatement는 Statement 객체보다 속도가 더 빨라서 많이쓴다고 함. 텍스트를 호출하는 기능은 같다.
      
--------------------------------------------------------------------------      
			
			if(rs.next()) {
				dto = new UserDto();
				
				dto.setId( rs.getString("id") );
				dto.setName( rs.getString("name") );
				dto.setAge( rs.getInt("age") );
				dto.setJoindate( rs.getString("joindate") );				
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBClose.close(psmt, conn, rs);			
		}
		
		return dto;
	}	
	
* 직접 데이터를 할당하였기 때문에 set~ 메소드들을 활용해준다.
---------------------------------------------------------
	// 다수의 Data 취득	
	public List<UserDto> getUserList() {
		
		String sql = " SELECT ID, NAME, AGE, JOINDATE "
				+ " FROM USERTEST ";
		
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<UserDto> list = new ArrayList<UserDto>();
		
		try {
			psmt = conn.prepareStatement(sql);			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String joindate = rs.getString("joindate");
				
				UserDto dto = new UserDto(id, name, age, joindate);
				
				list.add(dto);
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return list;
	}
    }

* 다수의 데이터를 가져오기 때문에 List<E> 클래스를 활용한다.
* while 문을 활용하여 전체 Table을 작성하여 list.add(dto) 에 담아준다.

--------------------------------------------------------------------
mainClass.Class
====================================================================
public class mainClass {

	public static void main(String[] args) {
		DBConnection.initConnection();
		
		SelectTest st = new SelectTest();
		
		String id = "abc";
		UserDto dto = st.search(id);
		if(dto != null) {
			System.out.println(dto.toString());
		}
		else {
			System.out.println("등록되어 있지 않는 id입니다.");
		}

* return int로 반환되는 경우 - 기본 예제 
------------------------------------------------------------------
		id = "ghi";
		dto = st.Select(id);
		if(dto != null) {
			System.out.println(dto.toString());
		}
		else {
			System.out.println("등록되어 있지 않는 id입니다.");
		}
	
  * return boolean으로 반환되는 경우 - " WHERE ID = ?" 
  ---------------------------------------------------------------
		List<UserDto> list = st.getUserList();
		for (UserDto user : list) {
		System.out.println(user.toString());
		}
		
	  }
    }

  * return list로 반환되는 경우 - for each 문을 활용하여 전체 테이블을 출력. 
 

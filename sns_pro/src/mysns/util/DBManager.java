package mysns.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
/*이걸 추가해줘야 되엇는데 //import org.apache.tomcat.jdbc.pool.DataSource; 추가해줘서 에러 ㅅㅂ
 * org.apache.tomcat.dbcp.dbcp2.BasicDataSource cannot be cast to org.apache.tomcat.jdbc.pool.DataSource
디비매니저 커넥터 문제?
	at mysns.util.DBManager.getConnection(DBManager.java:23)
	at mysns.sns.MessageDAO.getAll(MessageDAO.java:25)*/



public class DBManager {
	Statement stmt=null;
	PreparedStatement pstmt=null;
	/*jndi를 이용해 Connection 객체 리턴
	  @return
	 */
	public static Connection getConnection() {
		Connection conn;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds= (DataSource) envContext.lookup("jdbc/mysql");
			conn = ds.getConnection();
		}catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			System.out.println("디비매니저 커넥터 문제?");
			return null;
		}
		return conn;
	}
}

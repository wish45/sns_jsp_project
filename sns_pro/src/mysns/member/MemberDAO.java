package mysns.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import mysns.util.DBManager;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	/*신규회원등록
	 * @param member
	 * @return
	 * */
	public boolean addMember(MemberVO mvo) {
		conn=DBManager.getConnection();
		String sql="insert into s_member(name,uid,passwd,email,date) values(?,?,?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getName());
			pstmt.setString(2, mvo.getUid());
			pstmt.setString(3, mvo.getPasswd());
			pstmt.setString(4, mvo.getEmail());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			logger.info("error code:{}",e.getErrorCode());
			return false;
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	/*회원 로그인
	 * @param uid
	 * @param passwd
	 * @return
	 * */
	public boolean login(String uid,String passwd) {
		conn=DBManager.getConnection();
		String sql="select uid,passwd from s_member where uid=?";
		boolean result=false;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs=pstmt.executeQuery();
			rs.next();
			if(rs.getString("passwd").equals(passwd))
				result=true;
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	/*메인화면 우측 신규목록
	 * @return
	 * */
	public ArrayList<String> getNewMembers(){
		ArrayList<String> mList=new ArrayList<String>();
		conn=DBManager.getConnection();
		//회원목록은 7개까지만 가져옴.
		String sql="select * from s_member order by date desc limit 0,7";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				mList.add(rs.getString("uid"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
			logger.info("Error code :{}",e.getErrorCode());
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return mList;
		
	}
	
}






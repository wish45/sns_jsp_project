package mysns.sns;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import mysns.member.MemberDAO;
import mysns.util.*;

public class MessageDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	Logger logger=LoggerFactory.getLogger(MemberDAO.class);

	public ArrayList<MessageDTO> getAll(int cnt,String suid){
		ArrayList<MessageDTO> msgList=new ArrayList<MessageDTO>();
		conn=DBManager.getConnection();
		String sql;
		
		
		try {
			//전체 게시물인 경우
			if((suid==null)||(suid.equals(""))) {
				sql="select * from s_message order by date desc limit 0,?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
				
			}
			//특정 회원 게시물 온리인 경우
			else {
				sql="select * from s_message where uid=?order by date desc limit 0,?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, suid);
				pstmt.setInt(2, cnt);
			}
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				MessageDTO msdto=new MessageDTO();
				MessageVO mvo = new MessageVO();
				ArrayList<ReplyVO> rlist=new ArrayList<ReplyVO>();
				
				mvo.setMid(rs.getInt("mid"));
				mvo.setMsg(rs.getString("msg"));
				mvo.setDate(rs.getDate("date")+"/"+rs.getTime("date"));
				mvo.setFavcount(rs.getInt("favcount"));
				mvo.setUid(rs.getString("uid"));
				
				String rsql="select * from s_reply where mid=? order by date desc";
				pstmt=conn.prepareStatement(rsql);
				pstmt.setInt(1,rs.getInt("mid"));
				ResultSet rrs=pstmt.executeQuery();
				while(rrs.next()) {
					ReplyVO r = new ReplyVO();
					r.setRid(rrs.getInt("rid"));
					r.setUid(rrs.getString("uid"));
					r.setRmsg(rrs.getString("rmsg"));
					r.setDate(rrs.getDate("date")+"/"+rrs.getTime("date"));
					rlist.add(r);
				}
				rrs.last();
				mvo.setReplycount(rrs.getRow());
				logger.info("rrs.getRow()):"+rrs.getRow());
				
				msdto.setMessage(mvo);
				msdto.setRlist(rlist);
				msgList.add(msdto);
				rrs.close();
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			System.out.println("error check1");
		}finally {
			try {
				//rs.close();
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println(e.getErrorCode());
				System.out.println("error check2");
			}
		}
		return msgList;
	}
	/*신규 메시지 등록

	 *@param msg
	 *@return
	 */	
	public boolean newMsg(MessageVO msg) {
		conn=DBManager.getConnection();
		String sql="insert into s_message(uid,msg,date) values(?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, msg.getUid());
			pstmt.setString(2, msg.getMsg());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
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
	/*메시지 삭제
	 * @param mid
	 * @return
	 * */
	public boolean delMsg(int mid) {
		conn=DBManager.getConnection();
		String sql="delete from s_message where mid=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,mid);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
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
	/*게시글에 대한 답글 등록 , 원 게시물에 대한 mid필요
	 * @param mid
	 * @param rmsg
	 * @return
	 * */
	public boolean newReply(ReplyVO reply) {
		conn=DBManager.getConnection();
		String sql="insert into s_reply(mid,uid,rmsg,date) values(?,?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getMid());
			pstmt.setString(2, reply.getUid());
			pstmt.setString(3, reply.getRmsg());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
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
	/*답글삭제
	 * @param rid
	 * @return
	 * */
	public boolean delReply(int rid) {
		conn=DBManager.getConnection();
		String sql="delete from s_reply where rid=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rid);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
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
	/*좋아요 추기
	 * @param mid*/
	public void favorite(int mid) {
		conn=DBManager.getConnection();
		//좋아요 추가를 위해 favcount를 +1해서 update함
		String sql="update s_message set favcount=favcount+1 where mid=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

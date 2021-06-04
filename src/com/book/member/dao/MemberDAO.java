package com.book.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.book.dbconn.DBConn;
import com.book.member.vo.MemberVO;

public class MemberDAO {
	
	private static MemberDAO dao= null;
	
	private MemberDAO() {}
	
	public static MemberDAO getInstance() {
		if(dao==null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	
	public String selectLogin(String id, String pwd) {
		Connection conn = null; //connection 객체 생성
		Statement stmt = null;  //SQL 등록, 실행
		ResultSet rs = null;    //DB 결과값 받을 공간
		String result = "";
		
		try {
			conn = DBConn.getConnection();
			stmt = conn.createStatement(); //stmt 사용준비 
											//sql 사용준비
			String sql = "select id from member "
					+ "where id = '"+id+"' "
					+ "and pwd = '"+pwd+"'";
			rs = stmt.executeQuery(sql); //sql을 실행한 값을 
										//rs에 담아줌
			while(rs.next()) {
				result = rs.getString("id");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(stmt, rs, conn);
		}
		
		return result;		
	}
		
	public String selectLoginId(String id) {
		Connection conn = null; //connection 객체 생성
		Statement stmt = null;  //SQL 등록, 실행
		ResultSet rs = null;    //DB 결과값 받을 공간
		String result = "";
		
		try {
			conn = DBConn.getConnection();
			stmt = conn.createStatement(); //stmt 사용준비 
											//sql 사용준비
			String sql = "select id from member "
					+ "where id = '"+id+"' ";
					
			rs = stmt.executeQuery(sql); //sql을 실행한 값을 
										//rs에 담아줌
			while(rs.next()) {
				result = rs.getString("id");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(stmt, rs, conn);
		}
		
		return result;		
	}
		
	public int memberInsert(MemberVO mvo) {
		Connection conn = null; //connection 객체 생성
		PreparedStatement pstmt = null;  //SQL 등록, 실행
		int result = 0;
		
		try {
			conn = DBConn.getConnection();
		
			String sql = "insert into member "
					+ "(id, pwd, email, gender, joindate, phonenum, no) "
					+ "values (?, ?, ?, ?, sysdate, ?, NO_seq.nextval)";
			
			pstmt = conn.prepareStatement(sql); //pstmt 사용준비 
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getPwd());
			pstmt.setString(3, mvo.getEmail());
			pstmt.setString(4, mvo.getGender());
			pstmt.setString(5, mvo.getPhonenum());		
			
			result = pstmt.executeUpdate(); //sql을 실행한 값을 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(pstmt, null, conn);
		}
		
		return result;
		
	}	
	
	public ArrayList<MemberVO> selectAll() {
		Connection conn = null; //connection 객체 생성
		Statement stmt = null;  //SQL 등록, 실행
		ResultSet rs = null;    //DB 결과값 받을 공간
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			conn = DBConn.getConnection();
			stmt = conn.createStatement(); //stmt 사용준비 
											//sql 사용준비
			String sql = "select * from member";
			rs = stmt.executeQuery(sql); //sql을 실행한 값을 
										//rs에 담아줌
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setPhonenum(rs.getString("phonenum"));
				vo.setJoindate(rs.getString("joindate"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(stmt, rs, conn);
		}
		
		return list;
		
	}	
	
	public MemberVO selectMember(String id) {
		Connection conn = null; //connection 객체 생성
		Statement stmt = null;  //SQL 등록, 실행
		ResultSet rs = null;    //DB 결과값 받을 공간
		MemberVO mvo = new MemberVO();
		try {
			conn = DBConn.getConnection();
			stmt = conn.createStatement(); //stmt 사용준비 
											//sql 사용준비
			String sql = "select * from member "
					+ "where id = '"+id+"'";
			rs = stmt.executeQuery(sql); //sql을 실행한 값을 
										//rs에 담아줌
			while(rs.next()) {
				
				mvo.setId(rs.getString("id"));
				mvo.setPwd(rs.getString("pwd"));
				mvo.setEmail(rs.getString("email"));
				mvo.setGender(rs.getString("gender"));
				mvo.setPhonenum(rs.getString("phonenum"));
				mvo.setJoindate(rs.getString("joindate"));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(stmt, rs, conn);
		}
		
		return mvo;
		
	}
		
	public int updateMember(MemberVO mvo) {
		Connection conn = null; //connection 객체 생성
		PreparedStatement pstmt = null;  //SQL 등록, 실행
		ResultSet rs = null;    //DB 결과값 받을 공간
		int result=0;
		try {
			conn = DBConn.getConnection();
											//sql 사용준비
			String sql = "update member "
					+ "set pwd=?, email=?, gender=?, phonenum=? "
					+ "where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getPwd());
			pstmt.setString(2, mvo.getEmail());
			pstmt.setString(3, mvo.getGender());
			pstmt.setString(4, mvo.getPhonenum());
			pstmt.setString(5, mvo.getId());
			result = pstmt.executeUpdate(); //sql을 실행한 값을 
						
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(pstmt, rs, conn);
		}
		
		return result;
		
	}
	
	public int deleteMember(String id) {
		Connection conn = null; //connection 객체 생성
		PreparedStatement pstmt = null;  //SQL 등록, 실행
		ResultSet rs = null;    //DB 결과값 받을 공간
		int result=0;
		try {
			conn = DBConn.getConnection();
											//sql 사용준비
			String sql = "delete from member "
					+ "where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate(); //sql을 실행한 값을 
						
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(pstmt, rs, conn);
		}
		
		return result;
		
	}
	
	
	
	public void close(Statement stmt, ResultSet rs, Connection conn) {
		try {
			if(stmt!=null) {
				stmt.close();
			}
			if(rs !=null) {
				rs.close();
			}
			if(conn !=null) {
				conn.close();
			}
			
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		}
	}
	
	public void close(PreparedStatement pstmt, ResultSet rs, Connection conn) {
		try {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(rs !=null) {
				rs.close();
			}
			if(conn !=null) {
				conn.close();
			}
			
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		}
	}
	
}

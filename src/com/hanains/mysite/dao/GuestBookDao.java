package com.hanains.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hanains.mysite.vo.GuestBookVo;

public class GuestBookDao {
	
	private Connection getConnection() throws SQLException{
		
		Connection connection=null;
		
		try{
		// 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 연결하기(Oracle DB)
		
		String dbUrl="jdbc:oracle:thin:@localhost:1521:xe";
		connection=DriverManager.getConnection(dbUrl, "webdb","webdb");
		
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 - "+e);
		} 
		
		return connection;
		
	}

	/**
	 * 방명록 리스트 출력
	 */
	public List<GuestBookVo> getList(){
		
		List<GuestBookVo> list=new ArrayList<GuestBookVo>();
		
		Connection connection=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			
			connection=getConnection();
			
			stmt=connection.createStatement();
			
			String sql="select no, name, password, message, to_char(reg_date, 'YYYY-MM-DD') from guestbook order by no desc";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				
				Long no=rs.getLong(1);
				String name=rs.getString(2);
				String password=rs.getString(3);
				String message=rs.getString(4);
				String regDate=rs.getString(5);
				
				GuestBookVo vo=new GuestBookVo();
				vo.setNo(no);
				vo.setName(name);
				vo.setPassword(password);
				vo.setMessage(message);
				vo.setRegDate(regDate);
				
				list.add(vo);
			}
		
		} catch (SQLException e) {
			System.out.println("에러 - "+e);
		} finally {
			try {
				
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (connection != null) connection.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	/**
	 * 방명록 글쓰기
	 */
	public void insert(GuestBookVo vo){
		
		Connection connection=null;
		PreparedStatement pstmt = null;

		try {
			
			connection=getConnection();
			
			String sql="insert into guestbook values(guestbook_seq.nextval,?,?,?, SYSDATE)";
			pstmt=connection.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getMessage());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("에러 - "+e);
		} finally {
			try {
				
				if (pstmt != null) pstmt.close();
				if (connection != null) connection.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 방명록 삭제
	 */
	public void delete(Long no, String password){
		
		Connection connection=null;
		PreparedStatement pstmt=null;

		try {
			
			connection=getConnection();
			
			String sql="delete from guestbook where no=? and password=?";
			pstmt=connection.prepareStatement(sql);
			
			pstmt.setLong(1, no);
			pstmt.setString(2, password);
			
			pstmt.executeUpdate();
			
		}  catch (SQLException e) {
			System.out.println("에러 - "+e);
		} finally {
			try {
				
				if (pstmt != null) pstmt.close();
				if (connection != null) connection.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 글쓴이 비밀번호 체크
	 */
	public boolean isPassword(Long no, String password){
		
		Connection connection=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			
			connection=getConnection();
			
			String sql="select password from guestbook where no="+no;
			
			stmt=connection.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next()){ 
				if(rs.getString(1).equals(password))
					return true;
				else
					return false;
			}
			
		} catch (SQLException e) {
			System.out.println("에러 - "+e);
		} finally {
			try {
				
				if(rs!=null) rs.close();
				if (stmt != null) stmt.close();
				if (connection != null) connection.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return false;
	}
}
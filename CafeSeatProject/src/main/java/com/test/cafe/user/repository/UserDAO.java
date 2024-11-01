package com.test.cafe.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.cafe.user.model.UserDTO;
import com.test.util.DBUtil;

public class UserDAO {

	//정적 변수(자기 자신의 인스턴스를 담을 변수)
	private static UserDAO dao;
	
	private Connection conn;			//데이터베이스 연결을 위한 객체
	private Statement stat;				//SQL 쿼리 실행을 위한 객체
	private PreparedStatement pstat;	//파라미터가 있는 SQL 쿼리 실행을 위한 객체
	private ResultSet rs;				//쿼리 결과를 담을 객체
	
	
	public UserDAO() {
		
		this.conn = DBUtil.open("localhost", "jang", "java1234"); //데이터 베이스 연결
		
		try {
			if(!this.conn.isClosed()) {
				System.out.println("사용자 계정 연결 성공");
			} else {
				System.out.println("사용자 계정 연결 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static UserDAO getInstance() {
		
		if (dao == null) {
			dao = new UserDAO();	//인스턴스 없으면 생성
		}
		return dao; 				//이미 생성된 인스턴스를 반환
		
	}
	
	//로그인 메서드
	public UserDTO login(UserDTO dto) {
		
		try {
			
			String sql = "select * from tblUser where id = ? and pw = ?"; 
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) { //결과가 있으면
				
				UserDTO result = new UserDTO();	//결과를 담을 UserDTO 객체 생성
				
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setTel(rs.getString("tel"));
				result.setEmail(rs.getString("email"));
				result.setIng(rs.getInt("ing"));
				
				return result;	//로그인 성공 시 UserDTO 객체 반환
				
			}
		} catch (Exception e) {
			System.out.println("UserDAO.login");
			e.printStackTrace();
		}
		
		return null;	//로그인 실패 시 null 반환
	}
	
	
}

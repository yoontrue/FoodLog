package com.yoon.ha;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.yoon.ha.dbcp.FoodLogJdbc;

public class FoodLogDao {
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	// CRUD 쿼리문
	static String SELECT_ALL = "SELECT * FROM FOOD_LOG";
	static String SELECT_ONE = "SELECT * FROM FOOD_LOG WHERE NO=?";
	static String SELECT_NO = "SELECT NO FROM FOOD_LOG";
	static String INSERT = "INSERT INTO FOOD_LOG(FNAME,STORE,PRICE,STAR,DATE,TYPE,COMMENT,PICTURE) VALUES(?,?,?,?,?,?,?,?)";
	static String MODIFY = "UPDATE FOOD_LOG SET FNAME=?, STORE=?, PRICE=?, STAR=?, DATE=?, TYPE=?, COMMENT=?, PICTURE=? WHERE NO=?";
	static String DELETE = "DELETE FROM FOOD_LOG WHERE NO=?";
	
	public static void insert(FoodLogVo vo) {
		conn = FoodLogJdbc.getConnection();
		
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, vo.getFname());
			pstmt.setString(2, vo.getStore());
			pstmt.setString(3, vo.getPrice());
			pstmt.setString(4, vo.getStar());
			pstmt.setString(5, vo.getDate());
			pstmt.setString(6, vo.getType());
			pstmt.setString(7, vo.getComment());
			pstmt.setString(8, vo.getPfile());
			int sufa = pstmt.executeUpdate();
			if(sufa > 0) {
				System.out.println("저장 성공");
				conn.commit();
			} else {
				System.out.println("저장 실패");
				conn.rollback();
			}
		} catch (SQLException e) {
			System.out.println("저장 실패");
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
			e.printStackTrace();
		} finally {
			FoodLogJdbc.close(conn, pstmt, rs);
			FoodLogJdbc.close(stmt);
		}
	} // end of insert()
	
	public static List<FoodLogVo> selectAll() {
		List<FoodLogVo> list = new ArrayList<FoodLogVo>();
		conn = FoodLogJdbc.getConnection();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_ALL);
			while(rs.next()) {
				FoodLogVo food = new FoodLogVo();
				
				food.setNo(rs.getInt(1));
				food.setFname(rs.getString(2));
				food.setStore(rs.getString(3));
				food.setPrice(rs.getString(4));
				food.setStar(rs.getString(5));
				food.setDate(rs.getString(6));
				food.setType(rs.getString(7));
				food.setComment(rs.getString(8));
				food.setPfile(rs.getString(9));
				
				list.add(food);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			FoodLogJdbc.close(conn, stmt, rs);
		}
		
		return list;
	} // end of selectAll()
	
	public static FoodLogVo selectOne(FoodLogVo vo) {
		FoodLogVo food = null;
		conn = FoodLogJdbc.getConnection();
		
		try {
			pstmt=conn.prepareStatement(SELECT_ONE);
			pstmt.setInt(1, vo.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				food = new FoodLogVo();
				food.setNo(rs.getInt(1));
				food.setFname(rs.getString(2));
				food.setStore(rs.getString(3));
				food.setPrice(rs.getString(4));
				food.setStar(rs.getString(5));
				food.setDate(rs.getString(6));
				food.setType(rs.getString(7));
				food.setComment(rs.getString(8));
				food.setPfile(rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			FoodLogJdbc.close(conn, pstmt, rs);
		}
		return food;
	} // end of seletOne()
	
	public static void delete(FoodLogVo vo) {
		conn = FoodLogJdbc.getConnection();
		try {
			pstmt = conn.prepareCall(DELETE);
			pstmt.setInt(1, vo.getNo());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("삭제 완료!");
				conn.commit();
			} else {
				System.out.println("삭제 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			FoodLogJdbc.close(conn, pstmt, rs);
		}
	} // end of delete()
	
	public static void modify(FoodLogVo vo) {
		conn = FoodLogJdbc.getConnection();
		try {
			pstmt = conn.prepareStatement(MODIFY);
			pstmt.setString(1, vo.getFname());
			pstmt.setString(2, vo.getStore());
			pstmt.setString(3, vo.getPrice());
			pstmt.setString(4, vo.getStar());
			pstmt.setString(5, vo.getDate());
			pstmt.setString(6, vo.getType());
			pstmt.setString(7, vo.getComment());
			pstmt.setString(8, vo.getPfile());
			pstmt.setInt(9, vo.getNo());
			
			int cnt  = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("수정 완료!");
				conn.commit();
			} else {
				System.out.println("수정 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				System.out.println("수정 실패!");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			FoodLogJdbc.close(conn, pstmt, rs);
		}
	}
}

package com.kh.java.product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.product.model.vo.BuyVo;
import com.kh.java.product.model.vo.CartVo;
import com.kh.java.product.model.vo.ProductVo;


public class ProductDao {
	Properties prop = new Properties();
	public ProductDao(){
		String filename = ProductDao.class.getResource("/product/product_sql.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public int insertProduct(Connection conn, ProductVo pv) {
		String sql = "";
		PreparedStatement pstmt = null;
		int result = -1;
		
		sql = prop.getProperty("insertProduct");
		try {
			
			pstmt = conn.prepareStatement(sql);  
			pstmt.setString(1, pv.getName());
			pstmt.setString(2, pv.getCategory());
			pstmt.setInt(3, pv.getPrice());
			pstmt.setString(4, pv.getContent());
			pstmt.setString(5, pv.getImg_src());
			pstmt.setInt(6, pv.getWriterNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ProductVo> getRecommendList(Connection conn) {
		ArrayList<ProductVo> list = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectRList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<ProductVo>();
			while(rs.next()){
				ProductVo pv = new ProductVo();
				pv.setPno(rs.getInt("PNO"));
				pv.setName(rs.getString("P_NAME"));
				pv.setCategory(rs.getString("P_CATEGORY"));
				pv.setPrice(rs.getInt("P_PRICE"));
				pv.setContent(rs.getString("P_COMMENT"));
				pv.setImg_src(rs.getString("P_URL"));
				pv.setWriterNo(rs.getInt("P_FK_WNO"));

				list.add(pv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public ProductVo selectProduct(Connection conn, int pno) {
		ProductVo pv = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();

			while(rs.next()){
				pv = new ProductVo();
				pv.setPno(rs.getInt("PNO"));
				pv.setName(rs.getString("P_NAME"));
				pv.setCategory(rs.getString("P_CATEGORY"));
				pv.setPrice(rs.getInt("P_PRICE"));
				pv.setContent(rs.getString("P_COMMENT"));
				pv.setImg_src(rs.getString("P_URL"));
				pv.setWriterNo(rs.getInt("P_FK_WNO"));
				
				String name = rs.getString("M_NAME");
				pv.setWriterName(name);
				String addr = rs.getString("M_ADDRESS");
				pv.setWriterAddr(addr);
				String phone = rs.getString("M_PHONE");
				pv.setWriterPhone(phone);
				String email = rs.getString("M_ID");
				pv.setWriterEmail(email);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return pv;
	}

	public ArrayList<CartVo> getCartList(Connection conn, int mno) {
		ArrayList<CartVo> list = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectCList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<CartVo>();
			while(rs.next()){
				CartVo cv = new CartVo();
				ProductVo pv = new ProductVo();
				pv.setPno(rs.getInt("PNO"));
				pv.setName(rs.getString("P_NAME"));
				pv.setCategory(rs.getString("P_CATEGORY"));
				pv.setPrice(rs.getInt("P_PRICE"));
				pv.setContent(rs.getString("P_COMMENT"));
				pv.setImg_src(rs.getString("P_URL"));
				pv.setWriterNo(rs.getInt("P_FK_WNO"));
				
				cv.setCno(rs.getInt("SNO"));
				cv.setCount(rs.getInt("S_COUNT"));
				cv.setMno(mno);
				cv.setPv(pv);
				
				list.add(cv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int insertCart(Connection conn, int pno, int mno, int count) {
		int result = -1;
		String sql = null;
		PreparedStatement pstmt = null;
		
		sql = prop.getProperty("insertCart");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, pno);
			pstmt.setInt(3, mno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateCartCount(Connection conn, int cno, int count) {
		int result = -1;
		String sql = null;
		PreparedStatement pstmt = null;
		
		sql = prop.getProperty("updateCartCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, cno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertBuyList(Connection conn, ArrayList<BuyVo> list) {
		int result = -1;
		String sql = null;
		PreparedStatement pstmt = null;
		
		sql = prop.getProperty("insertBList");
		try {
			for(BuyVo bv:list){
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bv.getBnumber());
				pstmt.setString(2, bv.getM_name());
				pstmt.setString(3, bv.getP_name());
				pstmt.setInt(4, bv.getP_price());
				pstmt.setInt(5, bv.getP_count());
				pstmt.setInt(6, bv.getPno());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<BuyVo> getBuyList(Connection conn, String bnumber) {
		ArrayList<BuyVo> list = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectBList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bnumber);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<BuyVo>();
			while(rs.next()){
				BuyVo bv = new BuyVo();
				bv.setBno(rs.getString("BNO"));
				bv.setBnumber(bnumber);
				bv.setM_name(rs.getString("B_M_NAME"));
				bv.setP_name(rs.getString("B_P_NAME"));
				bv.setP_price(rs.getInt("B_P_PRICE"));
				bv.setP_count(rs.getInt("B_S_COUNT"));
				bv.setPno(rs.getInt("B_FK_PNO"));
				bv.setPayday(rs.getString("B_DATE"));

				list.add(bv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}
	
	public CartVo selectLastCart(Connection conn, int mno) {
		CartVo cv = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectLastCart");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			cv = new CartVo();
			while(rs.next()){
				ProductVo pv = new ProductVo();
				pv.setPno(rs.getInt("PNO"));
				pv.setName(rs.getString("P_NAME"));
				pv.setCategory(rs.getString("P_CATEGORY"));
				pv.setPrice(rs.getInt("P_PRICE"));
				pv.setContent(rs.getString("P_COMMENT"));
				pv.setImg_src(rs.getString("P_URL"));
				pv.setWriterNo(rs.getInt("P_FK_WNO"));
				
				cv.setCno(rs.getInt("SNO"));
				cv.setCount(rs.getInt("S_COUNT"));
				cv.setMno(mno);
				cv.setPv(pv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return cv;
	}



public ArrayList<BuyVo> getAllBuyList(Connection conn, String mname) {
		ArrayList<BuyVo> list = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectAllBList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<BuyVo>();
			while(rs.next()){
				BuyVo bv = new BuyVo();
				bv.setBno(rs.getString("BNO"));
				bv.setBnumber(rs.getString("BNUMBER"));
				bv.setM_name(rs.getString("B_M_NAME"));
				bv.setP_name(rs.getString("B_P_NAME"));
				bv.setP_price(rs.getInt("B_P_PRICE"));
				bv.setP_count(rs.getInt("B_S_COUNT"));
				bv.setPno(rs.getInt("B_FK_PNO"));
				bv.setPayday(rs.getString("B_DATE"));

				list.add(bv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int deleteCart(Connection conn, String[] cnos) {
		int result = -1;
		String sql = null;
		PreparedStatement pstmt = null;
		
		sql = prop.getProperty("deleteCart");
		try {
			for(int i=0; i<cnos.length; i++){
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(cnos[i]));
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public String getBnumber(Connection conn, String memberName) {
		String bnumber = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectBnumber");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bnumber = rs.getString("BNUMBER");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return bnumber;
	}

	public ArrayList<BuyVo> getMBuyList(Connection conn, int num) {
		ArrayList<BuyVo> list = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dflag = "F";
		String pflag = "F";
		
		switch(num){
		case 0:sql = prop.getProperty("selectBuyBeforeD");
			break;
		case 1:sql = prop.getProperty("selectBuyBeforeP");
			   dflag = "T";
			break;
		case 2:sql = prop.getProperty("selectBuyComplete");
			   dflag = "T";
			   pflag = "T";
			break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dflag);
			pstmt.setString(2, pflag);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<BuyVo>();
			while(rs.next()){
				BuyVo bv = new BuyVo();
				bv.setBno(rs.getString("BNO"));
				bv.setBnumber(rs.getString("BNUMBER"));
				bv.setM_name(rs.getString("B_M_NAME"));
				bv.setP_name(rs.getString("B_P_NAME"));
				bv.setP_price(rs.getInt("B_P_PRICE"));
				bv.setP_count(rs.getInt("B_S_COUNT"));
				bv.setPno(rs.getInt("B_FK_PNO"));
				bv.setPayday(rs.getString("B_DATE"));

				list.add(bv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int updateBv(Connection conn, int bno, String idx) {
		String sql = "";
		PreparedStatement pstmt = null;
		int result = -1;
		
		switch(idx){
			case "d":sql = prop.getProperty("updateDbv");
			break;
			case "p":sql = prop.getProperty("updatePbv");
			break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);  
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public BuyVo getBv(Connection conn, int bno) {
		BuyVo bv = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectBv");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();

			while(rs.next()){
				bv = new BuyVo();
				bv.setBno(rs.getString("BNO"));
				bv.setBnumber(rs.getString("BNUMBER"));
				bv.setM_name(rs.getString("B_M_NAME"));
				bv.setP_name(rs.getString("B_P_NAME"));
				bv.setP_price(rs.getInt("B_P_PRICE"));
				bv.setP_count(rs.getInt("B_S_COUNT"));
				bv.setPno(rs.getInt("B_FK_PNO"));
				bv.setPayday(rs.getString("B_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return bv;
	}

	public ArrayList<ProductVo> selectProdList(Connection conn, int mno) {
		ArrayList<ProductVo> list = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		sql = prop.getProperty("selectProdList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<ProductVo>();
			while(rs.next()){
				ProductVo pv = new ProductVo();
				pv.setPno(rs.getInt("PNO"));
				pv.setName(rs.getString("P_NAME"));
				pv.setCategory(rs.getString("P_CATEGORY"));
				pv.setPrice(rs.getInt("P_PRICE"));
				pv.setContent(rs.getString("P_COMMENT"));
				pv.setImg_src(rs.getString("P_URL"));
				pv.setWriterNo(rs.getInt("P_FK_WNO"));

				list.add(pv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int deleteProd(Connection conn, int mno, int pno) {
		String sql = "";
		PreparedStatement pstmt = null;
		int result = -1;
		
		sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);  
			pstmt.setInt(1, mno);
			pstmt.setInt(2, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateProduct(Connection conn, int mno, ProductVo pv) {
		String sql = "";
		PreparedStatement pstmt = null;
		int result = -1;
		
		sql = prop.getProperty("updateProduct");
		try {
			
			pstmt = conn.prepareStatement(sql);  
			pstmt.setString(1, pv.getName());
			pstmt.setString(2, pv.getCategory());
			pstmt.setInt(3, pv.getPrice());
			pstmt.setString(4, pv.getContent());
			pstmt.setString(5, pv.getImg_src());
			pstmt.setInt(6, mno);
			pstmt.setInt(7, pv.getPno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}


}

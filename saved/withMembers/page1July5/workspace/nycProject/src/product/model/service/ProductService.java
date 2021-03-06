package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.dao.ProductDao;
import product.model.vo.BuyVo;
import product.model.vo.CartVo;
import product.model.vo.ProductVo;

public class ProductService {

	public int insertProduct(ProductVo pv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = -1;
		result = new ProductDao().insertProduct(conn, pv);
		
		if(0<result){
			JDBCTemplate.commit(conn);
		}else{
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<ProductVo> getRecommendList() {
		ArrayList<ProductVo> list = null;
		Connection conn = JDBCTemplate.getConnection();
		
		list = new ProductDao().getRecommendList(conn);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public ProductVo selectProduct(int pno) {
		ProductVo pv = null;
		Connection conn = JDBCTemplate.getConnection();
		
		pv = new ProductDao().selectProduct(conn, pno);
		
		JDBCTemplate.close(conn);
		return pv;
	}
	
	public ArrayList<CartVo> getCartList(int mno) {
		ArrayList<CartVo> list = null;
		Connection conn = JDBCTemplate.getConnection();
		
		list = new ProductDao().getCartList(conn, mno);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertCart(int pno, int mno, int count) {
		Connection conn = JDBCTemplate.getConnection();
		int result = -1;
		
		result = new ProductDao().insertCart(conn, pno, mno, count);
		
		if(0<result){
			JDBCTemplate.commit(conn);
		}else{
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int updateCartCount(int cno, int count) {
		int result = -1;
		Connection conn = JDBCTemplate.getConnection();
		
		result = new ProductDao().updateCartCount(conn, cno, count);
		
		if(0<result){
			JDBCTemplate.commit(conn);
		}else{
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertBuyList(ArrayList<BuyVo> list) {
		int result = -1;
		Connection conn = JDBCTemplate.getConnection();
		
		result = new ProductDao().insertBuyList(conn, list);
		
		if(0<result){
			JDBCTemplate.commit(conn);
		}else{
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<BuyVo> getBuyList(String bnumber){
		ArrayList<BuyVo> list = null;
		Connection conn = JDBCTemplate.getConnection();
		
		list = new ProductDao().getBuyList(conn, bnumber);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int deleteCart(String[] cnos) {
		int result = -1;
		Connection conn = JDBCTemplate.getConnection();
		
		result = new ProductDao().deleteCart(conn, cnos);
		if(0<result){
			JDBCTemplate.commit(conn);
		}else{
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public String getBnumber(String memberName){
		String bnumber = null;
		Connection conn = JDBCTemplate.getConnection();
		
		bnumber = new ProductDao().getBnumber(conn, memberName);
		
		JDBCTemplate.close(conn);
		
		return bnumber;
	}
	
	public ArrayList<BuyVo> getMBuyList(int num){
		ArrayList<BuyVo> list = null;
		Connection conn = JDBCTemplate.getConnection();
		
		list = new ProductDao().getMBuyList(conn, num);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public BuyVo getBv(int bno) {
		BuyVo bv = null;
		Connection conn = JDBCTemplate.getConnection();
		
		bv = new ProductDao().getBv(conn, bno);
		
		JDBCTemplate.close(conn);
		return bv;
	}

	public int updateBv(int bno, String idx) {
		int result = -1;
		Connection conn = JDBCTemplate.getConnection();
		
		result = new ProductDao().updateBv(conn, bno, idx);
		if(0<result){
			JDBCTemplate.commit(conn);
		}else{
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}



}

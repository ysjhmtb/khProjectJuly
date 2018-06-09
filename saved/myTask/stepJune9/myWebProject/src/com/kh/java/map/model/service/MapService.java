package com.kh.java.map.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.dao.MapDao;
import com.kh.java.map.model.vo.MapVo;

public class MapService {

	public List<MapVo> getMapList(){
		Connection con = JDBCTemplate.getConnection();
		ArrayList<MapVo> list = new MapDao().selectMapList(con);
		JDBCTemplate.close(con);
		return list;
	}
}

package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.MapVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MapDAOImpl implements MapDAO {
	@Resource
	private SqlSessionTemplate template;
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.dao.MapDAO#getAllStationInfo()
	 */
	@Override
	public List<MapVO> getAllStationInfo(String name){
		return template.selectList("map.getAllStationInfo",name);
	}
}

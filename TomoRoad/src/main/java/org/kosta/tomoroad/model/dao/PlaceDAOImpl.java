package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.PlaceVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceDAOImpl implements PlaceDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<PlaceVO> getPlaceInfo(String id) {
		return template.selectList("place.getPlaceInfo",id);
	}
	
}

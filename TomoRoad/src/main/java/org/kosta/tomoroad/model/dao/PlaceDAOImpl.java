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
	public List<String> getKeyWord(String keyword) {
		System.out.println("dao다");
		return template.selectList("place.getKeyword",keyword);
	}
	
	@Override
	public List<PlaceVO> getPlaceInfo(String name) {
		return template.selectList("place.getPlaceInfo",name);
	}

}

package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.StationVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StationDAOImpl implements StationDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<StationVO> getStationInfo(String id) {
		System.out.println("dao다");
		return template.selectList("station.getStationInfo",id);
	}
}

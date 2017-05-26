package org.kosta.tomoroad.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StationDAOImpl implements StationDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<StationVO> getStationInfo() {
		return template.selectList("");
	}
}

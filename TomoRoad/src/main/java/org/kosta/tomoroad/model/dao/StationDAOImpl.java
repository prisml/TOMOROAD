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
	public List<String> getKeyword(String keyword) {
		return template.selectList("station.getKeyword",keyword);
	}

	@Override
	public List<StationVO> getTourInfoData() {
		System.out.println("dao다");
		return template.selectList("station.getTourInfoData");
	}

	@Override
	public StationVO getDetailInfo(String name) {
		System.out.println("dao다");
		return template.selectOne("station.getDetailInfo",name);
	}
	@Override
	public List<StationVO> getAllStationInfo(){
		return template.selectList("station.getAllStationInfo");
	}

}

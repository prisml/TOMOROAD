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
	public StationVO getInfo(String id) {
		System.out.println("dao다");
		return template.selectOne("station.getInfo",id);
	}

	@Override
	public List<StationVO> getList() {
		System.out.println("list dao다");
		List<StationVO> list = template.selectList("station.getList");
		System.out.println(list);
		return list;
	}

	@Override
	public List<String> getKeyword(String keyword) {
		return template.selectList("station.getKeyword",keyword);
	}

	@Override
	public List<StationVO> getTourInfoData() {
		System.out.println("dao다");
		return template.selectList("station.getTourInfoData");
	}

}

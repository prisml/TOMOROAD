package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.ConnectionVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.kosta.tomoroad.model.vo.TravelVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TomoroadingDAOImpl implements TomoroadingDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.tomoroad.model.dao.TomoradingDAO#locationInfo(java.lang.String)
	 */
	@Override
	public StationVO locationInfo(String name) {
		return template.selectOne("tomoroading.locationInfo", name);
	}

	@Override
	public List<ConnectionVO> getConnectionList() {
		return template.selectList("station.getConnectionList");
	}

	@Override
	public StationVO getStationInfo(String station) {
		return template.selectOne("station.getDetailInfo", station);
	}

	@Override
	public List<StationVO> getStationList() {
		return template.selectList("station.getAllStationInfo");
	}

	@Override
	public int getNumberOfStation() {
		return template.selectOne("station.getNumberOfStation");
	}
	@Override
	public void travel(TravelVO tvo){
		template.insert("tomoroading.travel",tvo);
	}
	@Override
	public TravelVO travelChecking(TravelVO tvo){
		return template.selectOne("tomoroading.travelChecking", tvo);
	}
	@Override
	public void reTravel(TravelVO tvo){
		template.update("tomoroading.reTravel",tvo);
	}
	@Override
	public void endTravel(TravelVO tvo){
		template.update("tomoroading.endTravel",tvo);
	}
	@Override
	public String getTravelRoute(String id){
		return template.selectOne("tomoroading.getTravelRoute", id);
	}
	@Override
	public int traveling(String id){
		return template.selectOne("tomoroading.traveling",id);
	}
}

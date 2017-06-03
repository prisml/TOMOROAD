package org.kosta.tomoroad.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.StationDAO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Service;

@Service
public class StationServiceImpl implements StationService {
	@Resource(name="stationDAOImpl")
	private StationDAO dao;

	@Override
	public List<StationVO> getStationInfo(String id) {
		System.out.println("서비스다");
		return dao.getStationInfo(id);
	}

	@Override
	public List<String> getKeyword(String keyword) {
		return dao.getKeyword(keyword);
	}
}

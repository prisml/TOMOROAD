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
	public List<StationVO> getStationInfo() {
		return dao.getStationInfo();
	}
}

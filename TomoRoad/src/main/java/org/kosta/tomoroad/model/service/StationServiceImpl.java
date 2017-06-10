package org.kosta.tomoroad.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.StationDAO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Service;

@Service
public class StationServiceImpl implements StationService {
	@Resource
	private StationDAO dao;

	@Override
	public List<String> getKeyword(String keyword) {
		return dao.getKeyword(keyword);
	}

	@Override
	public List<StationVO> getTourInfoData() {
		System.out.println("service다");
		return dao.getTourInfoData();
	}

	@Override
	public StationVO getDetailInfo(String name) {
		return dao.getDetailInfo(name);
	}
	@Override
	public List<StationVO> getAllStationInfo(){
		return dao.getAllStationInfo();
	}
}

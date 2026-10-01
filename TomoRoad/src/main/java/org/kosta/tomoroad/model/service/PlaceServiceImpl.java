package org.kosta.tomoroad.model.service;

import java.util.List;

import jakarta.annotation.Resource;

import org.kosta.tomoroad.model.dao.PlaceDAO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.springframework.stereotype.Service;

@Service
public class PlaceServiceImpl implements PlaceService {
	@Resource(name="placeDAOImpl")
	private PlaceDAO dao;

	@Override
	public List<String> getKeyWord(String keyword) {
		System.out.println("service다");
		return dao.getKeyWord(keyword);
	}
	
	@Override
	public List<PlaceVO> getPlaceInfo(String name) {
		return dao.getPlaceInfo(name);
	}

}

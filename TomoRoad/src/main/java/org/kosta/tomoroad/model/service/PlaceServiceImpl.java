package org.kosta.tomoroad.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.PlaceDAO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.springframework.stereotype.Service;

@Service
public class PlaceServiceImpl implements PlaceService {
	@Resource(name="placeDAOImpl")
	private PlaceDAO dao;

	@Override
	public List<PlaceVO> getPlaceInfo(String id) {
		return dao.getPlaceInfo(id);
	}
}

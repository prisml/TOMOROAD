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
	public StationVO getInfo(String id) {
		System.out.println("서비스다");
		return dao.getInfo(id);
	}

	@Override
	public List<StationVO> getList() {
		System.out.println("list 서비스다");
		List<StationVO> list = dao.getList();
		return list;
	}

	@Override
	public List<String> getKeyword(String keyword) {
		return dao.getKeyword(keyword);
	}
}

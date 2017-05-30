package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.StationVO;

public interface StationDAO {

	StationVO getInfo(String id);

	List<StationVO> getList();
	
}

package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.BurnVO;
import org.kosta.tomoroad.model.vo.ListVO;

public interface BurnService {	

	ListVO<BurnVO> getBurnList();	

	ListVO<BurnVO> getBurnList(String pageNo);

	BurnVO findBurnByNo(String no);

	void writeBurn(BurnVO bvo);

	void updateHits(String no);

	void updateBurn(BurnVO bvo);

	void deleteBurn(String no);

	ListVO getBurnListByStation(String stationName, String pageNo);

	List<String> getStationNameList();


}

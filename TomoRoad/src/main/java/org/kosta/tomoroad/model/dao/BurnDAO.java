package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnVO;
import org.kosta.tomoroad.model.vo.ListVO;

public interface BurnDAO {

	int getTotalCount();

	List<BurnVO> getBurnList(PagingBean pagingBean);

	BurnVO findBurnByNo(String no);

	void writeBurn(BurnVO bvo);

	void updateHits(String no);

	void updateBurn(BurnVO bvo);

	void deleteBurn(String no);

	List<BurnVO>  getBurnListByStation(PagingBean pagingBean, String stationName);

	int getTotalCountByStation(String stationName);

	List<String> getStationNameList();

	

}

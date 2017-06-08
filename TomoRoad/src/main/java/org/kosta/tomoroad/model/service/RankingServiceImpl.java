package org.kosta.tomoroad.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.RankingDAO;
import org.kosta.tomoroad.model.vo.RankingVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Service;

@Service
public class RankingServiceImpl implements RankingService {
	@Resource(name="rankingDAOImpl")
	private RankingDAO dao;

	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.service.RankingService#mapInfo()
	 */
	@Override
	public List<StationVO> mapInfo(){
		return dao.mapInfo();
	}

	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.service.RankingService#rankingInfo()
	 */
	@Override
	public List<RankingVO> rankingInfo() {
		// TODO Auto-generated method stub
		return dao.rankingInfo();
	}
}

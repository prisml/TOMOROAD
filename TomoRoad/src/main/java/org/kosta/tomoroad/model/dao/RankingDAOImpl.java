package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.RankingVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RankingDAOImpl implements RankingDAO {
	@Resource
	private SqlSessionTemplate template;
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.dao.RankingDAO#mapInfo()
	 */
	@Override
	public List<StationVO> mapInfo(){
		return template.selectList("ranking.rankingLocation");
	}

	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.dao.RankingDAO#rankingInfo()
	 */
	@Override
	public List<RankingVO> rankingInfo() {
		// TODO Auto-generated method stub
		return template.selectList("ranking.rankingInfo");
	}
}
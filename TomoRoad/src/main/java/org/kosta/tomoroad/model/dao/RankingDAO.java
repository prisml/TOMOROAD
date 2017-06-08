package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.RankingVO;
import org.kosta.tomoroad.model.vo.StationVO;

public interface RankingDAO {

	List<StationVO> mapInfo();

	List<RankingVO> rankingInfo();

}
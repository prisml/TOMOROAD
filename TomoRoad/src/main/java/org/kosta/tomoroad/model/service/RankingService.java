package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.RankingVO;
import org.kosta.tomoroad.model.vo.StationVO;

public interface RankingService {

	List<StationVO> mapInfo();

	List<RankingVO> rankingInfo();

}
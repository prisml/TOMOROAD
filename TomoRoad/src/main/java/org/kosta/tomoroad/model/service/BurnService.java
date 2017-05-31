package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.BurnCommentVO;

import org.kosta.tomoroad.model.vo.BurnVO;
import org.kosta.tomoroad.model.vo.ListVO;

public interface BurnService {

	ListVO<BurnVO> getBurnList();

	ListVO<BurnVO> getBurnList(String pageNo);

	BurnVO findBurnByNo(String no);

	void writeBurn(BurnVO bvo);

	void updateHits(String no);

	List<BurnCommentVO> findBurnCommentByNo(String no);

	String findCommentMemberId(int no);

	void updateBurn(BurnVO bvo);

	void deleteBurn(String no);

	ListVO<BurnVO> getBurnListByStation(String stationName, String pageNo);
	
	List<String> getStationNameList();
	
	void registeComment(BurnCommentVO vo);

	void deleteComment(BurnCommentVO vo);

	void updateComment(BurnCommentVO vo);

	void replyComment(BurnCommentVO vo);
}

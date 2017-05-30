package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.ListVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewVO;

public interface ReviewService {

	ListVO<ReviewVO> getList(String page);

	void register(ReviewVO vo);

	ReviewVO getDetail(String no);

	void update(ReviewVO vo);

	ReviewVO getDetailHit(String no);

	ListVO<ReviewVO> getListByMember(String page, String id);

	ListVO<ReviewVO> getListByPlace(String page, String place);

	void delete(String no);

	List<PlaceVO> getStationList();

}
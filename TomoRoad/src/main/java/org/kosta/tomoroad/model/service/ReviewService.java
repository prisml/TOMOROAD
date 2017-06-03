package org.kosta.tomoroad.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.tomoroad.model.vo.ListVO;
import org.kosta.tomoroad.model.vo.ReviewVO;

public interface ReviewService {

	ListVO<ReviewVO> getList(String page);

	void register(ReviewVO vo);

	ReviewVO getDetail(String no);

	void update(ReviewVO vo);

	ReviewVO getDetailHit(String no);

	List<ReviewVO> getKeyword(String keyword, String reviewFilter);

}
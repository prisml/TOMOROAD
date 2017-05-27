package org.kosta.tomoroad.model.service;

import org.kosta.tomoroad.model.vo.ListVO;
import org.kosta.tomoroad.model.vo.ReviewVO;

public interface ReviewService {

	ListVO<ReviewVO> getList(String page);

	void register(ReviewVO vo);

	ReviewVO getDetail(String no);

}
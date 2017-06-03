package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.ReviewVO;

public interface ReviewDAO {

	int getTotalContents();

	List<ReviewVO> getList(PagingBean pb);

	void register(ReviewVO vo);

	ReviewVO getDetail(String no);

	void update(ReviewVO vo);

	List<ReviewVO> getKeyword(String keyword, String reviewFilter);

}
package org.kosta.tomoroad.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewVO;

public interface ReviewDAO {

	int getTotalContents();

	List<ReviewVO> getList(PagingBean pb);

	void register(ReviewVO vo);

	ReviewVO getDetail(String no);

	void update(ReviewVO vo);


	List<ReviewVO> getKeyword(String keyword, String reviewFilter);

	List<ReviewVO> getListByMember(PagingBean pb, String id);

	List<ReviewVO> getListByPlace(PagingBean pb, String place);

	void delete(String no);

	List<PlaceVO> getStationList();

	void hits(String no);
	
	int getreview_recommendByreviewNo(int review_no);

	void review_recommend(Map<String, Object> map);
}
package org.kosta.tomoroad.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewCommentVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.kosta.tomoroad.model.vo.StationVO;

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

	List<PlaceVO> getPlaceList(String name);

	void hits(String no);
	
	int getRecommendByNo(int no);

	void recommend(Map<String, Object> map);

	Map<String, Object> isRecommend(Map<String, Object> temp);

	void deleteRecommend(Map<String, Object> map);

	void writeComment(ReviewCommentVO vo);

	List<ReviewCommentVO> getCommentList(String no);
	
	List<ReviewVO> getReviewListByPlace(int no);

	List<StationVO> getStationList();
	
}
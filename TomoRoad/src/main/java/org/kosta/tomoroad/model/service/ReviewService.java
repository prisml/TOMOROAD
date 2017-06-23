package org.kosta.tomoroad.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.tomoroad.model.vo.ListVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewCommentVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.kosta.tomoroad.model.vo.StationVO;

public interface ReviewService {

	ListVO<ReviewVO> getList(String page);

	void register(ReviewVO vo);

	Map<String, Object> getDetail(String no, String id);

	void update(ReviewVO vo);

	ReviewVO getDetailHit(String no);

	List<ReviewVO> getKeyword(String keyword, String reviewFilter);

	ListVO<ReviewVO> getListByMember(String page, String id);

	ListVO<ReviewVO> getListByPlace(String page, String place);

	void delete(String no);

	List<PlaceVO> getPlaceList(String name);
	
	void recommend(String id,int no);
	
	int getRecommendByNo(int review_no);

	Map<String, Object> getUpdateDetail(String no);

	Map<String, Object> getDetail(String no);

	List<ReviewVO> getReviewListByPlace(int no);
	
	void writeComment(ReviewCommentVO vo, int reviewNo);

	ListVO<ReviewVO> getListByMemberInMemberPage(String page, String id);

	List<StationVO> getStaionList();

	int getTotalContentsByMember(String id);

	void updateImgCount(int imgCount, int no);


}
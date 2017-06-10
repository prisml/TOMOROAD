package org.kosta.tomoroad.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewCommentVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public int getTotalContents() {
		return template.selectOne("review.getTotalContents");
	}

	@Override
	public List<ReviewVO> getList(PagingBean pb) {
		return template.selectList("review.getList", pb);
	}

	@Override
	public void register(ReviewVO vo) {
		template.insert("review.register", vo);
	}

	@Override
	public ReviewVO getDetail(String no) {
		return template.selectOne("review.detail", no);
	}

	@Override
	public void update(ReviewVO vo) {
		template.update("review.update", vo);
	}

	@Override
	public List<ReviewVO> getListByMember(PagingBean pb, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pb", pb);
		map.put("id", id);
		return template.selectList("review.getListByMember", map);
	}

	@Override
	public List<ReviewVO> getListByPlace(PagingBean pb, String place) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pb", pb);
		map.put("place", place);
		return template.selectList("review.getListByPlace", map);
	}

	@Override
	public void delete(String no) {
		template.delete("review.delete", no);
	}

	@Override
	public List<PlaceVO> getPlaceList() {
		return template.selectList("place.getList");
	}

	@Override
	public void hits(String no) {
		template.update("review.updateHits", Integer.parseInt(no));
	}

	@Override
	public void recommend(Map<String,Object> map) {
		template.insert("recommend",map);
	}

	@Override
	public int getRecommendByNo(int no) {
		return template.selectOne("getRecommendByNo",no);
	}

	@Override
	public List<ReviewVO> getKeyword(String keyword,String reviewFilter) {
		String filter="";
		System.out.println("dao에서의 filter->"+filter);
		System.out.println("dao에서의 reviewFilter->"+reviewFilter);
		if(reviewFilter.equals("제목만")){
			System.out.println("제목만인 경우 reviewFilter:"+reviewFilter);
			filter="Title";
			System.out.println("제목만인 경우 filter:"+filter);
		}else{
			System.out.println("제목과 내용인 경우 reviewFilter:"+reviewFilter);
			filter="TitleAndContent";
			System.out.println("제목과 내용인 경우 filter:"+filter);
		}
		return template.selectList("review.get"+filter,keyword);
	}

	@Override
	public Map<String, Object> isRecommend(Map<String, Object> map) {
		return template.selectOne("review.isRecommend", map);
	}

	@Override
	public void deleteRecommend(Map<String, Object> map) {
		template.delete("review.deleteRecommend",map);
	}

	@Override
	public List<ReviewVO> getReviewListByPlace(int no) {
		return template.selectList("review.getReviewListByPlace",no);
	}
	
	public void writeComment(ReviewCommentVO vo) {
		template.insert("review.writeComment",vo);
	}
}

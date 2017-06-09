package org.kosta.tomoroad.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.ReviewDAO;
import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.ListVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource(name="reviewDAOImpl")
	private ReviewDAO dao;

	@Override
	public ListVO<ReviewVO> getList(String page) {
		ListVO<ReviewVO> lvo = new ListVO<ReviewVO>();
		PagingBean pb = new PagingBean(Integer.parseInt(page), 4, 5, dao.getTotalContents());
		lvo.setPagingBean(pb);
		lvo.setList(dao.getList(pb));
		return lvo;
	}

	@Override
	public void register(ReviewVO vo) {
		System.out.println(vo);
		dao.register(vo);
	}

	@Override
	public Map<String, Object> getDetail(String no, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		ReviewVO vo = dao.getDetail(no);
		vo.setRecommend(getRecommendByNo(Integer.parseInt(no)));
		map.put("rvo", vo);
		Map<String, Object> temp = new HashMap<String, Object>();
		temp.put("review_no", no);
		temp.put("member_id", id);
		map.put("recommend", dao.isRecommend(temp));
		return map;
	}

	@Override
	public Map<String, Object> getDetail(String no) {
		Map<String, Object> map = new HashMap<String, Object>();
		ReviewVO vo = dao.getDetail(no);
		vo.setRecommend(getRecommendByNo(Integer.parseInt(no)));
		map.put("rvo", vo);
		return map;
	}

	@Override
	public void update(ReviewVO vo) {
		dao.update(vo);
	}

	@Override
	public ReviewVO getDetailHit(String no) {
		dao.hits(no);
		ReviewVO vo = dao.getDetail(no);
		/*vo.setHits(vo.getHits()+1);
		dao.update(vo);*/
		System.out.println(vo);
		return vo;
	}

	@Override
	public List<ReviewVO> getKeyword(String keyword,String reviewFilter) {
		System.out.println("service야");
		System.out.println("서비스에서의"+reviewFilter);
		return dao.getKeyword(keyword,reviewFilter);
	}

	public ListVO<ReviewVO> getListByMember(String page, String id) {
		ListVO<ReviewVO> lvo = new ListVO<ReviewVO>();
		PagingBean pb = new PagingBean(Integer.parseInt(page), 9, 5, dao.getTotalContents());
		lvo.setPagingBean(pb);
		lvo.setList(dao.getListByMember(pb, id));
		return lvo;
	}

	@Override
	public ListVO<ReviewVO> getListByPlace(String page, String place) {
		ListVO<ReviewVO> lvo = new ListVO<ReviewVO>();
		PagingBean pb = new PagingBean(Integer.parseInt(page), 9, 5, dao.getTotalContents());
		lvo.setPagingBean(pb);
		lvo.setList(dao.getListByPlace(pb, place));
		return lvo;
	}

	@Override
	public void delete(String no) {
		dao.delete(no);
	}

	@Override
	public List<PlaceVO> getPlaceList() {
		return dao.getPlaceList();
	}

	@Override
	public void recommend(String id, int no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", id);
		map.put("review_no", no);
		if(dao.isRecommend(map)==null)
			dao.recommend(map);
		else
			dao.deleteRecommend(map);
	}

	@Override
	public int getRecommendByNo(int no) {
		return dao.getRecommendByNo(no);
	}

	@Override
	public Map<String, Object> getUpdateDetail(String no) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("rvo", getDetail(no));
		map.put("placeList", getPlaceList());
		return map;
	}

	@Override
	public List<ReviewVO> getReviewListByPlace(int no) {
		return dao.getReviewListByPlace(no);
	}
}

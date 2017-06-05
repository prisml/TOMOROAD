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
	public ReviewVO getDetail(String no) {
		ReviewVO vo = dao.getDetail(no);
		vo.setRecommend(getRecommendByNo(Integer.parseInt(no)));
		return vo;
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
	public List<PlaceVO> getStationList() {
		return dao.getStationList();
	}

	@Override
	public void recommend(String member_id, int review_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("review_no", review_no);
		dao.recommend(map);
	}

	@Override
	public int getRecommendByNo(int review_no) {
		return dao.getRecommendByNo(review_no);
	}
}

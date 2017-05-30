package org.kosta.tomoroad.model.service;

import java.util.List;

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
		PagingBean pb = new PagingBean(Integer.parseInt(page), 9, 5, dao.getTotalContents());
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
		return dao.getDetail(no);
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

}

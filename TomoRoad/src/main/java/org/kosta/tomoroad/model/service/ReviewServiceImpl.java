package org.kosta.tomoroad.model.service;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.ReviewDAO;
import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.ListVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource(name="reviewDAOImpl")
	private ReviewDAO dao;

	@Override
	public ListVO<ReviewVO> getList(String page) {
		ListVO<ReviewVO> lvo = new ListVO<ReviewVO>();
		PagingBean pb = new PagingBean(1, 9, 5, dao.getTotalContents());
		lvo.setPagingBean(pb);
		lvo.setList(dao.getList(pb));
		return lvo;
	}

	@Override
	public void register(ReviewVO vo) {
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
		ReviewVO vo = dao.getDetail(no);
		vo.setHits(vo.getHits()+1);
		dao.update(vo);
		return vo;
	}

}

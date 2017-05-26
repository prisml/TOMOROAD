package org.kosta.tomoroad.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.ReviewDAO;
import org.kosta.tomoroad.model.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	private ReviewDAO dao;

	@Override
	public Map<String, Object> getList(String page) {
		Map<String, Object> map = new HashMap<String, Object>();
		PagingBean pb = new PagingBean(1, 9, 5, dao.getTotalContents());
		map.put("pb", pb);
		map.put("reviewList", dao.getList(pb));
		return map;
	}

}

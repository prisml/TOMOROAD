package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.PagingBean;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public int getTotalContents() {
		return template.selectOne("getTotalContents");
	}

	@Override
	public List<ReviewVO> getList(PagingBean pb) {
		return template.selectList("getList",pb);
	}
}

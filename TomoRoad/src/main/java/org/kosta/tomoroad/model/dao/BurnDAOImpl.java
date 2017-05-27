package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BurnDAOImpl implements BurnDAO{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public int getTotalCount() {		
		return template.selectOne("burn.getTotalCount");
	}

	@Override
	public List<BurnVO> getBurnList(PagingBean pagingBean) {		
		return template.selectList("burn.getBurnList",pagingBean);
	}
	
}

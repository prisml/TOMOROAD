package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnCommentVO;
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
	
	@Override
	public BurnVO findBurnByNo(String no){
		return template.selectOne("burn.findBurnByNo",no);
	}

	@Override
	public void writeBurn(BurnVO bvo) {
		System.out.println(bvo);
		template.insert("burn.writeBurn",bvo);		
	}

	@Override
	public void updateHits(String no) {
		template.update("burn.updateHits",no);		
	}

	@Override
	public List<BurnCommentVO> findBurnCommentByNo(String no) {
		// TODO Auto-generated method stub
		return template.selectList("burn.findBurnCommentByNo",no);
	}

	@Override
	public Object findParentCommentMemberId(int no) {
		// TODO Auto-generated method stub
		return template.selectOne("burn.findParentCommentMemberId",no);
	}
	
	
	
}

package org.kosta.tomoroad.model.dao;

import java.util.HashMap;
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
	public void updateBurn(BurnVO bvo) {
		template.update("burn.updateBurn",bvo);		
	}

	@Override
	public void deleteBurn(String no) {
		template.delete("burn.deleteBurn",no);		
	}

	@Override
	public List<BurnVO> getBurnListByStation(PagingBean pagingBean, String stationName) {		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("pagingBean", pagingBean);
		map.put("stationName", stationName);		
		return template.selectList("burn.getBurnListByStation",map);		
	}

	@Override
	public int getTotalCountByStation(String stationName) {		
		return template.selectOne("burn.getTotalCountByStation",stationName);
	}
	
	
	
}

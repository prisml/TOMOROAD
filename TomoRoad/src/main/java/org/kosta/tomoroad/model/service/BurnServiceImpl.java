package org.kosta.tomoroad.model.service;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.BurnDAO;
import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnListVO;
import org.springframework.stereotype.Service;

@Service
public class BurnServiceImpl implements BurnService{
	@Resource(name="burnDAOImpl")
	private BurnDAO burnDAO;	
	
	@Override
	public BurnListVO getBurnList(){
		return getBurnList("1");
	}
	@Override
	public BurnListVO getBurnList(String pageNo) {
		int totalCount = burnDAO.getTotalCount();
		
		PagingBean pagingBean = null;
		if(pageNo==null){
			pagingBean = new PagingBean(totalCount);
		}else{
			pagingBean = new PagingBean(totalCount,Integer.parseInt(pageNo));
		}
		
		return new BurnListVO(burnDAO.getBurnList(pagingBean), pagingBean);
	}
	
}

package org.kosta.tomoroad.model.burn;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.pagingbean.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class BurnServiceImpl implements BurnService{
	@Resource
	private BurnDAO dao;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BurnVO> getBurnList(PagingBean pagingBean) {
		// TODO Auto-generated method stub
		return null;
	}

}

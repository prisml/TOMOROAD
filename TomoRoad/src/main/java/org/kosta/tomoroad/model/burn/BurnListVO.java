package org.kosta.tomoroad.model.burn;

import java.util.List;

import org.kosta.tomoroad.model.pagingbean.PagingBean;


public class BurnListVO {
	private List<BurnVO> list;
	private PagingBean pagingBean;
	
	public BurnListVO() {
		super();
	}

	public BurnListVO(List<BurnVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<BurnVO> getList() {
		return list;
	}

	public void setList(List<BurnVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "BurnListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
	
}

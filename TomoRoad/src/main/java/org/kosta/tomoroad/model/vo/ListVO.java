package org.kosta.tomoroad.model.vo;

import java.util.List;

import org.kosta.tomoroad.model.utils.PagingBean;

public class ListVO<T> {
	private List<T> list;
	private PagingBean pagingBean;

	public ListVO() {
		super();
	}

	public ListVO(List<T> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
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

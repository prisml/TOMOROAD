package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.utils.PagingBean;
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
		return template.selectList("getList", pb);
	}

	@Override
	public void register(ReviewVO vo) {
		template.insert("register", vo);
	}

	@Override
	public ReviewVO getDetail(String no) {
		return template.selectOne("detail", no);
	}

	@Override
	public void update(ReviewVO vo) {
		template.update("update", vo);
	}

	@Override
	public List<ReviewVO> getKeyword(String keyword,String reviewFilter) {
		String filter="";
		System.out.println("dao에서의 filter->"+filter);
		System.out.println("dao에서의 reviewFilter->"+reviewFilter);
		if(reviewFilter.equals("제목만")){
			System.out.println("제목만인 경우 reviewFilter:"+reviewFilter);
			filter="Title";
			System.out.println("제목만인 경우 filter:"+filter);
		}else{
			System.out.println("제목과 내용인 경우 reviewFilter:"+reviewFilter);
			filter="TitleAndContent";
			System.out.println("제목과 내용인 경우 filter:"+filter);
		}
		return template.selectList("review.get"+filter,keyword);
	}
}

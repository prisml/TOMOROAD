package org.kosta.tomoroad.model.burn;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BurnDAOImpl implements BurnDAO{
	@Resource
	private SqlSessionTemplate template;
	
}

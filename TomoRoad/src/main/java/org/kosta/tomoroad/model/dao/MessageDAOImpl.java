package org.kosta.tomoroad.model.dao;

import jakarta.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {
	@Resource
	private SqlSessionTemplate template;

}

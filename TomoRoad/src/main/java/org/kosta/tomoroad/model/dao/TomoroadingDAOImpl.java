package org.kosta.tomoroad.model.dao;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.StationVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TomoroadingDAOImpl implements TomoroadingDAO {
	@Resource(name="SqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.dao.TomoradingDAO#locationInfo(java.lang.String)
	 */
	@Override
	public StationVO locationInfo(String name){
		return template.selectOne("tomoroading.locationInfo",name);
	}
}

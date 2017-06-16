package org.kosta.tomoroad.model.dao;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.BucketVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BucketDAOImpl implements BucketDAO {
	@Resource
	private SqlSessionTemplate template;
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.dao.BucketDAO#findBucket(org.kosta.tomoroad.model.vo.BucketVO)
	 */
	@Override
	public int findBucket(BucketVO vo){
		return template.selectOne("bucket.findBucket",vo);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.dao.BucketDAO#insertBucket(org.kosta.tomoroad.model.vo.BucketVO)
	 */
	@Override
	public void insertBucket(BucketVO vo){
		template.insert("bucket.insertBucket",vo);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.dao.BucketDAO#deleteBucket(org.kosta.tomoroad.model.vo.BucketVO)
	 */
	@Override
	public void deleteBucket(BucketVO vo){
		template.delete("bucket.deleteBucket",vo);
	}
}

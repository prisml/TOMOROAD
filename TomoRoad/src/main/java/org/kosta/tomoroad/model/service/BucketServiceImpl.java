package org.kosta.tomoroad.model.service;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.BucketDAO;
import org.kosta.tomoroad.model.vo.BucketVO;
import org.springframework.stereotype.Service;

@Service
public class BucketServiceImpl implements BucketService {
	@Resource(name="bucketDAOImpl")
	private BucketDAO dao;
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.service.BucketService#findBucket(org.kosta.tomoroad.model.vo.BucketVO)
	 */
	@Override
	public int findBucket(BucketVO vo){
		return dao.findBucket(vo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.service.BucketService#insertBucket(org.kosta.tomoroad.model.vo.BucketVO)
	 */
	@Override
	public void insertBucket(BucketVO vo){
		dao.insertBucket(vo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.service.BucketService#deleteBucket(org.kosta.tomoroad.model.vo.BucketVO)
	 */
	@Override
	public void deleteBucket(BucketVO vo){
		dao.deleteBucket(vo);
	}
}

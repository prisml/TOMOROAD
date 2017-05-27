package org.kosta.tomoroad;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.tomoroad.model.service.StationService;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-*.xml"})
public class TestUnit {
	@Resource(name="stationServiceImpl")
	private StationService stationService;
	
	@Test
	public void test(){
		List<StationVO> list= stationService.getStationInfo();
		System.out.println(list);
	}
}

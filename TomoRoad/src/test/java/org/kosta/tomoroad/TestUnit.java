package org.kosta.tomoroad;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.tomoroad.model.service.PlaceService;
import org.kosta.tomoroad.model.service.StationService;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-*.xml"})
public class TestUnit {
	@Resource(name="stationServiceImpl")
	private StationService stationService;
	
	@Resource(name="placeServiceImpl")
	private PlaceService placeService;

	@Test
	public void test(){
		// 역 정보 얻어오기
		List<StationVO> stationInfoList= stationService.getStationInfo("전주");
		System.out.println("역정보:"+stationInfoList);
		
		// 역 주면 관광지 정보 얻어오기
		List<PlaceVO> placeInfolist= placeService.getPlaceInfo("전주");
		System.out.println("역주변정보:"+placeInfolist);
		
	}
}

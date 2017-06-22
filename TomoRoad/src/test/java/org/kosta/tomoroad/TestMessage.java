package org.kosta.tomoroad;

import java.io.IOException;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.tomoroad.model.service.BurnService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-*.xml"})
public class TestMessage {
	
	
	@Resource(name="burnServiceImpl")
	private BurnService service;
	
	@Test
	public void test() throws IOException{
		service.getFilteredMessage("java");
	}
}

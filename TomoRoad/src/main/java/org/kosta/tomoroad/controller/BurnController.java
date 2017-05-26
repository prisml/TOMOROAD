package org.kosta.tomoroad.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.tomoroad.model.burn.BurnListVO;
import org.kosta.tomoroad.model.burn.BurnService;
import org.kosta.tomoroad.model.burn.BurnVO;
import org.kosta.tomoroad.model.pagingbean.PagingBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BurnController {
	@Resource
	private BurnService service;
	
	@RequestMapping("getBurnList.do")
	public String getBurnList(HttpServletRequest request, Model model){
		PagingBean pagingBean = null;
		String pno = request.getParameter("pageNo");
		
		if(pno==null){
			pagingBean = new PagingBean(service.getTotalCount());
		}else{
			pagingBean = new PagingBean(service.getTotalCount(),Integer.parseInt(pno));
		}
		ArrayList<BurnVO> list = (ArrayList<BurnVO>) service.getBurnList(pagingBean);
		
		BurnListVO lvo = new BurnListVO(list,pagingBean);
		
		model.addAttribute("lvo", lvo);
		
		return "board/list";
	}
	
}

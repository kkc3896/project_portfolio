package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.been.CrawlingBean;
import com.test.service.CrawlingService;

@Controller
public class CrawlingController {
	@Autowired
	private CrawlingService crawlingService;
	
	// 크롤링 화면
	@GetMapping(value = "crawling_view")
	public String Crawling_List(Model model) throws Exception{
		System.out.println("crawling.jsp실행");
		// 조회
		List<CrawlingBean> crawling_List = crawlingService.Crawling_List();
		model.addAttribute("crawling_List", crawling_List);
		
		return "crawling/crawling";
	}
	
	
	// 크롤링 처리 - post
	@PostMapping(value = "Crawling_Write")
	public String Crawling_Write(CrawlingBean crawlingBean) throws Exception {
		crawlingService.Crawling_Write(crawlingBean);
		return "redirect:crawling_view";
	}
	
	
	
	
}

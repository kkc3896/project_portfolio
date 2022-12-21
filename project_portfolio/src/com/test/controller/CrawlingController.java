package com.test.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;

import javax.servlet.jsp.PageContext;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.service.CrawlingService;

@Controller
public class CrawlingController {
	@Autowired
	private CrawlingService crawlingService;
	
	// 크롤링 화면
	@GetMapping(value = "crawling_view")
	public String crawling(String url) throws IOException{
		System.out.println("crawling.jsp실행");
		
		return "crawling/crawling";
	}

	// 크롤링 기능처리
	@GetMapping(value = "crawling")
	public String Crawling(Model model) throws IOException {
		String name = "아이유";
		String url = "https://www.genie.co.kr/search/searchMv?query=" + name;// 크롤링할 url
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get(); // Document에는 페이지의 전체 소스가 저장된다
		} catch (IOException e) {
			e.printStackTrace();
		}

		// select를 이용하여 원하는 태그를 선택한다.
		Elements element = doc.select("tr.list"); // MV 리스트가 있는 태그
		String defaulturl = "https://www.genie.co.kr/detail/mediaInfo?xvnm=";

		for (Element element1 : element) {
			System.out.println("제목 : " + element1.select("td a").attr("title")); // 제목 크롤링
			System.out.println("url : " + defaulturl + element1.attr("mvid")); // url id 크롤링
			System.out.println("썸네일 : " + element1.select("td a img").attr("src") + "\n"); // 썸네일 크롤링
		}
		
		model.addAttribute("element_title", element.select("td a").attr("title"));
		model.addAttribute("element_mvid", defaulturl + element.attr("mvid"));
		model.addAttribute("element_img", element.select("td a img").attr("src"));
		
		return "redirect:crawling_view";
	}

}

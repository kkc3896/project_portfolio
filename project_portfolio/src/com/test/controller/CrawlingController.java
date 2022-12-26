package com.test.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	/*
	// 크롤링 기능처리
	@GetMapping(value = "crawling")
	public void Crawling(Model model) throws IOException {
		// 음원차트 지니 실시간 차트 받아오기
		// 크롤링할 url
		String url = "https://www.genie.co.kr/";
		Document doc = null;
		
		try {
			// Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get(); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// select를 이용하여 원하는 태그를 선택한다.
		//Elements element = doc.select("td.info"); 	// 실시간차트 제목 : 가져올수 있다. 순위 : 못 가져온다.
		Elements element = doc.select("tr.list"); 		// 실시간차트  제목 : 가져올수 있다. 순위 : 가져올수 있다.
		
		System.out.println("실시간 차트 1 ~ 10 순위 나열");
		for (Element element1 : element) {
			System.out.print(element1.select("td.number").text() + "\t");	// 순위
			System.out.println(element1.select("a.title.ellipsis").text() + "\n"); // 제목
		}
	}
	*/
	// 크롤링 기능처리
	@GetMapping(value = "crawling")
	public void Crawling() throws IOException {
		// 음원차트 지니 실시간 차트 받아오기
		// 크롤링할 url
		String url = "https://www.genie.co.kr/";
		Document doc = null;
		
		try {
			// Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get(); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// select를 이용하여 원하는 태그를 선택한다.
		Elements element = doc.select("tr.list"); 		// 실시간차트  제목 : 가져올수 있다. 순위 : 가져올수 있다.
		
		System.out.println("실시간 차트 1 ~ 10 순위 나열");
		for (Element element1 : element) {
			
			String c_title = element1.select("td.number").text();
			String c_ranking = element1.select("td.number").text();
					
			System.out.print(element1.select("td.number").text() + "\t");	// 순위
			System.out.println(element1.select("a.title.ellipsis").text() + "\n"); // 제목
			
		}
		

	}
	
	
}

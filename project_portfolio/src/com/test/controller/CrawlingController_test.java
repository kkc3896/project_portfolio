package com.test.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.service.CrawlingService;

@Controller
public class CrawlingController_test {
	@Autowired
	private CrawlingService crawlingService;

	// 입력된 값 크롤링 하기
	@GetMapping(value = "crawling_test")
	public void Crawling() throws IOException {
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
	}

	// 값을 입력하여 크롤링 하기
	@GetMapping(value = "crawling_insert_test")
	public void Crawling_insert() throws IOException {
		// 값을 입력 하기 위해..
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		// 입력 데이터 읽기
		String str = reader.readLine(); // Hi Anna

		// 입력 데이터 출력
		System.out.println(str); // Hi Anna

		String url = "https://www.genie.co.kr/search/searchMv?query=" + str;// 크롤링할 url
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
		
	}
	
	
	// 값을 입력하여 크롤링 하기
	@GetMapping(value = "crawling_inserts_test")
	public void Crawling_inserts() throws IOException {
		// 값을 입력 하기 위해..
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		// 반복해서 입력 데이터 읽기
		String str;
		while ((str = reader.readLine()) != null) {
			// 입력 데이터 출력
			System.out.println(str);
			System.out.println("=============================");
			String url = "https://www.genie.co.kr/search/searchMv?query=" + str;// 크롤링할 url
			
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
		}
		
		
		
	
		
	}

}

package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.CrawlingDao;

@Service
public class CrawlingService {
	@Autowired
	private CrawlingDao crawlingDao;
	
	
}

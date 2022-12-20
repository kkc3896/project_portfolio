package com.test.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/*
 * 파일 다운로드 이용시 java쪽에서는 아래의 경로만 업로드 되어있는곳으로 바꿔주고
 *  String filePath = "D:\\test\\upload\\" + filename;
 * view쪽에서는 아래와 같이 작성해서 사용하면 된다.
 *  <c:url var="path" value="fileDownload?fileName=${Job_Read.fileName}" />
 *  <c:url var="path" value="fileDownload?fileName=${임의로정한파라미터명.fileName}" />
 *  
 */

@Controller
public class FileDownload {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	// 파일다운로드
	@GetMapping("fileDownload")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			// 파일명을 가져온다.
			String fileName = request.getParameter("fileName");
			System.out.println(fileName);

			// 파일이 업로드 되어있는(파일이 존재하는) 경로를 지정한다.
			String filePath = "C:\\test\\upload\\" + fileName;

			// 파일명과 경로를 객체로 생선한다.
			File oopFile = new File(filePath);

			// 파일 길이를 가져온다.
			long fileSize = oopFile.length();

			// 파일이 존재한다면
			if (fileSize > 0) {
				// 파일명을 URLEncoder 하여 attachment, Content-Disposition Header로 설정
				String encodeFilename = "attachment; fileName*=" + "UTF-8" + "''"
						+ URLEncoder.encode(fileName, "UTF-8");

				// ContentType 설정
				response.setContentType("application/octet-stream; charset=utf-8");

				// Header 설정
				response.setHeader("Content-Disposition", encodeFilename);

				// ContentLength 설정
				response.setContentLengthLong(fileSize);

				BufferedInputStream in = null;
				BufferedOutputStream out = null;

				/*
				 * BufferedInputStream = java.io의 가장 기본 파일 입출력 클래스, 입력 스트림(통로)을 생성해줌, 사용법은
				 * 간단하지만, 버퍼를 사용하지 않기 때문에 느림, 속도 문제를 해결하기 위해 버퍼를 사용하는 다른 클래스와 같이 쓰는 경우가 많음
				 */
				in = new BufferedInputStream(new FileInputStream(oopFile));

				/*
				 * BufferedOutputStream = java.io의 가장 기본이 되는 파일 입출력 클래스, 출력 스트림(통로)을 생성해줌, 사용법은
				 * 간단하지만, 버퍼를 사용하지 않기 때문에 느림, 속도 문제를 해결하기 위해 버퍼를 사용하는 다른 클래스와 같이 쓰는 경우가 많음
				 */
				out = new BufferedOutputStream(response.getOutputStream());

				try {
					byte[] buffer = new byte[4096];
					int bytesRead = 0;
					/*
					 * 모두 현재 파일 포인터 위치를 기준으로 함 (파일 포인터 앞의 내용은 없는 것처럼 작동) int read() : 1byte씩 내용을 읽어
					 * 정수로 반환 int read(byte[] b) : 파일 내용을 한번에 모두 읽어서 배열에 저장 int read(byte[] b, int
					 * off, int len) : 'len'길이만큼만 읽어서 배열의 'off'번째 위치부터 저장
					 */
					while ((bytesRead = in.read(buffer)) != -1) {
						out.write(buffer, 0, bytesRead);
					}

					// 버퍼에 남은 내용이 있다면, 모두 파일에 출력
					out.flush();
				} finally {
					/*
					 * 현재 열려있는 in,out 스트림을 닫음 메모리 누수를 방지하고 다른 곳에서 리소스 사용이 가능하게 만듬
					 */
					in.close();
					out.close();
				}
			} else {
				throw new FileNotFoundException("파일이 없습니다.");
			}
		} catch (Exception e) {
			logger.info(e.getMessage());

		}

	}
}

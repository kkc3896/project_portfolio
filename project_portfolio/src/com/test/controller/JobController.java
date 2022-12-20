package com.test.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.been.JobBeen;
import com.test.been.SearchBean;
import com.test.service.JobService;

@Controller
public class JobController {

	@Autowired
	private JobService jobService;

	// 목록_list - 페이징 추가
	@GetMapping("Job_List") // 호출할때는 GET방식으로 한다.
	public String Job_List(Model model, JobBeen jobBeen, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "job_name") String searchType,
			@RequestParam(required = false) String keyword, @ModelAttribute("searchBean") SearchBean searchBean)
			throws Exception {

		// 검색
		searchBean.setSearchType(searchType);
		searchBean.setKeyword(keyword);
		model.addAttribute("searchBean", searchBean);

		// 전체 개시글 개수
		int listCnt = jobService.getBoardListCnt(searchBean);

		// 검색 후 페이지
		searchBean.pageInfo(page, range, listCnt);

		// 페이징
		model.addAttribute("pagination", searchBean);

		// 게시글 목록_list
		List<JobBeen> Job_List = jobService.Job_List(searchBean);
		model.addAttribute("Job_List", Job_List);
//        model.addAttribute("Job_List", jobService.Job_List(searchBean));

		return "board/job_list";
	}

	// 입력_write_view
	// 글쓰기는 폼과 글쓰기처리를위한 컨트롤러가 2개 필요하다.
	@GetMapping("Job_Write") // 호출할때는 GET방식으로 한다.
	public String Job_Write_view(Model model, JobBeen jobBeen) throws Exception {
		return "board/job_write";
	}

	/*
	 * // 입력_write_pro
	 * 
	 * @PostMapping("Job_Write_pro") // 전송할때는 POST방식으로 한다. public String
	 * Job_Write_pro(@ModelAttribute("jobBeen") JobBeen jobBeen, Model model) throws
	 * Exception{ // 단일 파일 업로드 처리 - 파일이름이 같은건 글작성은 가능하지만 업로드 폴더에 새롭게 생기지않고 기존파일에 덮어
	 * 씌운다. // 업로드시 랜덤으로 파일이름 변경하는 코드
	 * 
	 * String fileName = null; MultipartFile uploadFile = jobBeen.getUploadFile();
	 * if (!uploadFile.isEmpty()) { String originalFileName =
	 * uploadFile.getOriginalFilename(); // 파일이름 구하기 String ext =
	 * FilenameUtils.getExtension(originalFileName); // 확장자 구하기 UUID uuid =
	 * UUID.randomUUID(); // 파일이름을 랜덤으로 하기위해 사용 fileName = uuid + "." + ext; //
	 * 파일업로드시 랜덤으로 하기위해서.. UUID는 확장자이름을 별도로 붙여야 하니 이렇게 사용하자 //업로드파일의 경로를 지정한다
	 * uploadFile.transferTo(new File("C:\\test\\upload\\" + fileName)); }
	 * jobBeen.setFileName(fileName); System.out.println(jobBeen.getFileName());
	 */
	// /업로드시 랜덤으로 파일이름 변경하는 코드

	/*
	 * // 업로드시 파일이름 변경 하지 않는 코드 String fileName = null; MultipartFile uploadFile =
	 * jobBeen.getUploadFile(); if (!uploadFile.isEmpty()) { String originalFileName
	 * = uploadFile.getOriginalFilename(); // 파일이름 구하기 fileName = originalFileName;
	 * // 파일업로드시 originalFileName은 파일 원래 이름 확장자까지 구해오니 이렇게 작성하고 랜덤으로 파일명을 변환시 위의 코드를
	 * 주석풀고 사용하자 //업로드파일의 경로를 지정한다 uploadFile.transferTo(new
	 * File("C:\\test\\upload\\" + fileName)); } jobBeen.setFileName(fileName);
	 * System.out.println(jobBeen.getFileName()); // /업로드 파일이름 변경 하지 않는 코드
	 * 
	 * jobService.Job_Write(jobBeen);
	 * 
	 * return "redirect:/Job_List"; // 리다이렉트를 사용할때는 경로가아니라 매핑명을 사용한다. }
	 */
	// 입력_write_pro
	@PostMapping("Job_Write_pro") // 전송할때는 POST방식으로 한다.
		public String Job_Write_pro(@ModelAttribute("jobBeen") JobBeen jobBeen,
									@RequestParam(value = "uploadFile", required = false) List<MultipartFile> uploadFileList) throws Exception{
			// 업로드 경로
			String uploadPath = "C:\\test\\upload";
			
			// 파일 경로가 없을때를 대비해 적었다.
			File file = new File(uploadPath + jobBeen.getFileName());
			
			// // 경로에 폴더가 없다면 실행
			if(file.exists() == false) {
				// 경로에 폴더가 없으면 생성
				file.mkdirs(); 	
			}
			
			// 다중업로드를위해 for문을 쓴다.
			for(MultipartFile uploadFile : uploadFileList) {
				
				// 업로드파일 원래이름을 구한다.
				String uploadFileName = uploadFile.getOriginalFilename();
				
				// 파일이름이 중복되면 올라가지 않으므로 랜덤으로 변경시켜주기위해 UUID를 사용한다.
				UUID uuid = UUID.randomUUID(); //원본파일명이랑 서버에저장할파일명을 구분하기위해 UUID를 사용했다
				
				// UUID(랜덤문자라생각하면편함) + _ + 원본파일명  형태로 바뀐다.
				// 예시) 6fb7ea1c-7674-4852-8df3-dadeb6187fe1_프로젝트 기획 및 참고자료.txt 
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				
				// 실제 업로드파일 생성
				File saveFile = new File(uploadPath, uploadFileName);
				
				try {
					uploadFile.transferTo(saveFile);
					// db에 파일이름을 저장 한다. 
					jobBeen.setFileName(uploadFileName);
				}catch (Exception e) {
					// TODO: handle exception
					e.getMessage();
				}
			}
			
			
			jobService.Job_Write(jobBeen);
			
			return "redirect:/Job_List";		// 리다이렉트를 사용할때는 경로가아니라 매핑명을 사용한다.
		}

	// 글읽기_read
	@GetMapping("Job_Read") // 호출할때는 GET방식으로 한다.
	public String Job_Read(Model model, int job_idx, JobBeen jobBeen) throws Exception {

		// 조회수_count
		// 조회수 증가를위해 - 리스트에있는 글을 클릭해야 조회수가 올라가므로 기능을 목록컨트롤러가 아닌 상세보기컨트롤러쪽에서 기능을 추가한다.
		jobService.Job_Count(job_idx);

		// 인자값은 파라미터 값으로 기본키인 글번호를 기준으로 Model을 사용하여 불러옴
		model.addAttribute("Job_Read", jobService.Job_Read(job_idx));

		return "board/job_read";
	}

	// 글수정_update_view
	@GetMapping("Job_Update")
	public String Job_Update(Model model, int job_idx) throws Exception {

		JobBeen jobBeen = jobService.Job_Read(job_idx); // 수정기능을 하려면 글을 읽어야하므로 상세보기 서비스 호출하여 객체로 만들기
		model.addAttribute("Job_Update", jobBeen);

		return "board/job_update";
	}

	// 글수정_update_pro
	@PostMapping("Job_Update_pro")
	public String Job_Update_pro(JobBeen jobBeen) throws Exception {
		/**/
		// 파일 업로드
		String fileName = null;
		MultipartFile uploadFile = jobBeen.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			// String ext = FilenameUtils.getExtension(originalFileName); // 확장자구하기
			// UUID uuid = UUID.randomUUID(); // uuid구하기
			// fileName = uuid + "." + ext;
			fileName = originalFileName;
			uploadFile.transferTo(new File("D:\\test\\upload\\" + fileName));
			jobBeen.setFileName(fileName);
		} else {
			jobService.Job_Update(jobBeen);
			return "redirect:/Job_List";
		}

		jobService.Job_Update(jobBeen);

		return "redirect:/Job_List"; // 수정이 완료된 후, 목록페이지로 리턴 리다이렉트를 사용할때는 경로가아니라 매핑명을 사용한다.

	}

	// 삭제_delete
	@PostMapping("Job_Delete")
	public String Job_Delete(int job_idx) throws Exception {
		jobService.Job_Delete(job_idx); // 글삭제 서비스 호출
		return "redirect:/Job_List"; // 삭제가 완료된 후 목록페이지로 리턴, 리다이렉트를 사용할때는 경로가아니라 매핑명을 사용한다.
	}

}

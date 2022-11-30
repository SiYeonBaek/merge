package com.korea.ttrs;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.ProductDAO;
import dao.UserDAO;
import util.MyCommon;
import vo.ProductVO;
import vo.UserVO;

@Controller
public class AdminController {

	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	UserDAO user_dao;

	@Autowired
	ServletContext application;
	

	@RequestMapping("/admin_main.do")
	public String admin_main() {
		return MyCommon.ADMIN_VIEW_PATH + "admin_main.jsp";
	}
	
	@RequestMapping("/admin_info.do")
	public String amdin_info() {
		
		return MyCommon.ADMIN_VIEW_PATH + "admin_info.jsp";
	}

	// 상품리스트 페이지
	@RequestMapping("/addproduct_list.do")
	public String addproduct_list(Model model) {
		List<ProductVO> list = product_dao.selectList();

		model.addAttribute("list", list);

		return MyCommon.ADMIN_VIEW_PATH + "addproduct_list.jsp";
	}

	@RequestMapping("/addproduct_form.do")
	public String addproduct_form(ProductVO vo) {


		return MyCommon.ADMIN_VIEW_PATH + "addproduct_form.jsp";
	}
	
	@RequestMapping("/addproduct_insert.do")
	public String addproduct_insert(ProductVO vo, Errors errors) {
		
		System.out.println(vo.getPmainimg());
		
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		

		// 업로드 된 파일의 정보
		MultipartFile filemaininfo1 = vo.getFilemaininfo1();
		MultipartFile fileinfo1 = vo.getFileinfo1();
		MultipartFile fileinfo2 = vo.getFileinfo2();
		MultipartFile fileinfo3 = vo.getFileinfo3();
		MultipartFile fileinfo4 = vo.getFileinfo4();
		MultipartFile fileinfo5 = vo.getFileinfo5();
		MultipartFile fileinfo6 = vo.getFileinfo6();
		MultipartFile fileinfo7 = vo.getFileinfo7();
		MultipartFile fileinfo8 = vo.getFileinfo8();
		MultipartFile fileinfo9 = vo.getFileinfo9();
		MultipartFile fileinfo10 = vo.getFileinfo10();
		
		System.out.println(filemaininfo1);

		String pmainimg = "";
		String psubimg1 = "";
		String psubimg2 = "";
		String psubimg3 = "";
		String psubimg4 = "";
		String psubimg5 = "";
		String psubimg6 = "";
		String psubimg7 = "";
		String psubimg8 = "";
		String psubimg9 = "";
		String psubimg10 = "";

		

		// 업로드 된 파일이 존재한다면..
		if (!filemaininfo1.isEmpty()) {
			// 업로드될 실제 파일명
			pmainimg = filemaininfo1.getOriginalFilename();
			System.out.println("------- pmainImg-----");
			System.out.println(pmainimg);
			System.out.println("-----------------------");
			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, pmainimg);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				pmainimg = String.format("%d_%s",time,pmainimg);
				saveFile = new File(savePath, pmainimg);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				filemaininfo1.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo1.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg1 = fileinfo1.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg1);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg1 = String.format("%d_%s", time, psubimg1);
				saveFile = new File(savePath, psubimg1);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo1.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo2.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg2 = fileinfo2.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg2);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg2 = String.format("%d_%s", time, psubimg2);
				saveFile = new File(savePath, psubimg2);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo2.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo3.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg3 = fileinfo3.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg3);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg3 = String.format("%d_%s", time, psubimg3);
				saveFile = new File(savePath, psubimg3);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo3.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo4.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg4 = fileinfo4.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg4);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg4 = String.format("%d_%s", time, psubimg4);
				saveFile = new File(savePath, psubimg4);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo4.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo5.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg5 = fileinfo5.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg5);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg5 = String.format("%d_%s", time, psubimg5);
				saveFile = new File(savePath, psubimg5);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo5.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo6.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg6 = fileinfo6.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg6);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg6 = String.format("%d_%s", time, psubimg6);
				saveFile = new File(savePath, psubimg6);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo6.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo7.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg7 = fileinfo7.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg7);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg7 = String.format("%d_%s", time, psubimg7);
				saveFile = new File(savePath, psubimg7);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo7.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo8.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg8 = fileinfo8.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg8);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg8 = String.format("%d_%s", time, psubimg8);
				saveFile = new File(savePath, psubimg8);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo8.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo9.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg9 = fileinfo9.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg9);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg9 = String.format("%d_%s", time, psubimg9);
				saveFile = new File(savePath, psubimg9);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo9.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 업로드 된 파일이 존재한다면..
		if (!fileinfo10.isEmpty()) {
			// 업로드될 실제 파일명
			psubimg10 = fileinfo10.getOriginalFilename();

			// 파일을 저장할 경로
			// savePath 경로까지 가서 filename에 있는지 확인
			File saveFile = new File(savePath, psubimg10);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 동일 파일명 방지
				long time = System.currentTimeMillis();
				psubimg10 = String.format("%d_%s", time, psubimg10);
				saveFile = new File(savePath, psubimg10);
			}

			// 업로드를 위한 실제 파일을 물리적으로 기록
			try {
				fileinfo10.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		vo.setPmainimg(pmainimg); // vo에 묶어서 같이 전달하기
		vo.setPsubimg1(psubimg1); // vo에 묶어서 같이 전달하기
		vo.setPsubimg2(psubimg2); // vo에 묶어서 같이 전달하기
		vo.setPsubimg3(psubimg3); // vo에 묶어서 같이 전달하기
		vo.setPsubimg4(psubimg4); // vo에 묶어서 같이 전달하기
		vo.setPsubimg5(psubimg5); // vo에 묶어서 같이 전달하기
		vo.setPsubimg6(psubimg6); // vo에 묶어서 같이 전달하기
		vo.setPsubimg7(psubimg7); // vo에 묶어서 같이 전달하기
		vo.setPsubimg8(psubimg8); // vo에 묶어서 같이 전달하기
		vo.setPsubimg9(psubimg9); // vo에 묶어서 같이 전달하기
		vo.setPsubimg10(psubimg10); // vo에 묶어서 같이 전달하기

		
		
		System.out.println(fileinfo10);
		
		int res = product_dao.insert(vo);
		
		return "redirect:addproduct_list.do";
		
	}
	
	// 상품 삭제
	@ResponseBody
	@RequestMapping("/addproduct_delete.do")
	public String addproduct_delete(HttpServletRequest request) {
		String[] list = request.getParameterValues("arr");
		
		for(int i=0; i<list.length; i++) {
			
			int res = product_dao.delete(list[i]);
		}
		
		return "redirect:addproduct_list.do";
	}
	
	@RequestMapping("/modifyproduct_form.do")
	public String modify_form(Model model, String pidx) {
		System.out.println(pidx);
		//체크된 인덱스가 무엇인지 받아와서 넣어주기...
		ProductVO vo = product_dao.selectOne(pidx);
	
		model.addAttribute("vo", vo);
		
		System.out.println("--------여기가 Modifyform으로 가는 곳이다!!!!!!!!!!!!!!!!!!!");
		System.out.println(vo);
		
		return MyCommon.ADMIN_VIEW_PATH + "modifyproduct_form.jsp";
	}
	
	@RequestMapping("/modifyproduct.do")
	public String modifyproduct(ProductVO vo, HttpServletRequest request) {
		System.out.println("------------상품 수정을 해볼꽈???????????????????");
		int res = product_dao.update(vo);
		System.out.println(res);
		
		return "redirect:addproduct_list.do";
	}
	
	
	 // 유저 관리 페이지
	 @RequestMapping("/memManagement_list.do") 
	 public String memManagement_list(Model model) { 
		 List<UserVO> list = user_dao.selectList();
	  
		 model.addAttribute("list", list);
		  
		 return MyCommon.ADMIN_VIEW_PATH + "memManagement_list.jsp"; 
	 }
	 
	
}

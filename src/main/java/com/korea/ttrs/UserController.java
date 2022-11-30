package com.korea.ttrs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import util.MyCommon;
import vo.MyPageVO;
import vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	UserDAO user_dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	// Login 입력 페이지로 이동
	@RequestMapping("/userLogin_form.do")
	public String userLogin_form() {
		return MyCommon.USER_VIEW_PATH + "userLogin_form.jsp";
	}
	
	// 회원가입 선택 페이지로 이동 -> 사이트&카카오&네이버 로그인 선택
	@RequestMapping("/userSignUpSelect.do")
	public String userSignUpSelect() {
		return MyCommon.USER_VIEW_PATH + "userSignUpSelect.jsp";
	}
	
	// 회원가입 페이지로 이동
	@RequestMapping("/UserSignUp_form.do")
	public String userSignUp_form() {
		return MyCommon.USER_VIEW_PATH + "userSignUp_form.jsp";
	}
	
	// 약관 동의 페이지로 이동
	@RequestMapping("/terms_agree.do")
	public String terms_agree() {
		return MyCommon.USER_VIEW_PATH + "terms_agree_form.jsp";
	}
	
	// 아이디 중복체크하기 위한 메서드
	@RequestMapping("/check_id.do")
	@ResponseBody
	public String check_id(String uId) {
		UserVO vo = user_dao.id_check_selectOne(uId);
		
		String res = "no"; // 중복이 있을 경우 회원가입 안됨
		
		if(vo == null) res = "yes"; // 회원가입이 가능한 경우
		String result = String.format("[{'res':'%s'}]", res);
		
		return result;
	}
	
	// 회원가입을 위한 메서드(insert)
	@RequestMapping("/userInsert.do")
	public String userInsert(UserVO vo) {
		int res = user_dao.user_insert(vo);
		
		if(res > 0) {
			return "userLogin_form.do";
			
		}
		return "userLogin_form.do";
	}
	
	// 유저 로그인 메서드
	@RequestMapping("/userLogin.do")
	@ResponseBody
	public String userLogin(String uid, String upwd) {
		UserVO vo = null;
		
		vo = user_dao.id_check_selectOne(uid);
		
		String param = "";
		String resultStr = "";
		
		if(vo == null) {
			// 아이디 자체가 없다는 의미이므로,
			param = "no_id";
			resultStr = String.format("[{'param':'%s'}]", param);
			return resultStr;
		}
		
		if(!vo.getUpwd().equals(upwd)) {
			// 아이디는 있지만 비밀번호가 다를 경우,
			System.out.println(vo.getUpwd());
			param = "no_pwd";
			resultStr = String.format("[{'param':'%s'}]", param);
			return resultStr;
		}
		
		// session 영역에 저장
		session = request.getSession();
		session.setMaxInactiveInterval(600);
		session.setAttribute("vo", vo);
		
		// 로그인에 성공했을 경우
		param = "clear";
		resultStr = String.format("[{'param':'%s'}]", param);
		return resultStr;
	}
	
	// 로그아웃 메서드
	@RequestMapping("/userLogout.do")
	public String userLogout() {
		session = request.getSession();
		session.removeAttribute("vo");
		return "redirect:userLogin_form.do";
	}
	
	// 아이디 찾기 페이지로 이동하는 메서드
	@RequestMapping("/findId_form.do")
	public String findId_form() {
		return MyCommon.USER_VIEW_PATH + "userFindId_form.jsp";
	}
	
	// 아이디 찾기 구현
	@RequestMapping("/findId.do")
	public String findId(UserVO user, Model model) {
		UserVO vo = user_dao.find_id_selectOne(user);
		model.addAttribute("vo", vo);
		
		return MyCommon.USER_VIEW_PATH + "userFindIdResult_form.jsp";
	}
	
	// 비밀번호 찾기 페이지로 이동하는 메서드
	@RequestMapping("/findPwd_form.do")
	public String findPwd_form() {
		return MyCommon.USER_VIEW_PATH + "userFindPwd_form.jsp";
	}
	
	// 비밀번호 찾기 구현
	@RequestMapping("/findPwd.do")
	public String findPwd(UserVO user, Model model) {
		UserVO vo = user_dao.find_pwd_selectOne(user);
		model.addAttribute("vo", vo);
		
		return MyCommon.USER_VIEW_PATH + "userFindPwdResult_form.jsp";
	}
	
	// 비밀번호 변경
	@RequestMapping("/change_pwd.do")
	public String change_pwd(UserVO vo) {
		int res = user_dao.change_pwd(vo);
		
		if(res > 0) {
			return MyCommon.USER_VIEW_PATH + "changePwdResult_form.jsp";
		}
		
		return "";
	}
	
	// 마이페이지 이동
	@RequestMapping("/myPage.do")
	public String myPage_form(String uidx, Model model) {
		List<MyPageVO> list = user_dao.OrderSelectList(uidx);
		model.addAttribute("list", list);
		
		return MyCommon.USER_VIEW_PATH + "userMyPage_form.jsp";
	}
	
	// 회원정보 수정하는 페이지로 이동
	@RequestMapping("/userModify.do")
	public String userModify_form(String uidx, Model model) {
		UserVO vo = user_dao.user_selectOne(uidx);
		model.addAttribute("vo", vo);
		
		return MyCommon.USER_VIEW_PATH + "userModify_form.jsp";
	}
	
	// 회원정보 수정
	@RequestMapping("/modify.do")
	public String modify(UserVO vo) {
		int res = user_dao.userModify(vo);
		return "userModify.do"; 
	}
	
	// 회원정보 -> 비밀번호 변경
	@RequestMapping("/userPwdChange.do")
	public String userPwdChange_form(String uidx) {
		return MyCommon.USER_VIEW_PATH + "userPwdChange_form.jsp";
	}
	
	// 비밀번호 변경
	@RequestMapping("/changePwd.do")
	public String changePwd(UserVO vo, Model model) {
		int res = user_dao.changePwd(vo);
		model.addAttribute("vo", vo);
		
		return MyCommon.USER_VIEW_PATH + "changePwdResult_form.jsp";
	}
	
	// 회원탈퇴 form으로 이동
	@RequestMapping("/userLeave_form.do")
	public String userLeave_form(String uidx, Model model) {
		UserVO vo = user_dao.user_selectOne(uidx);
		model.addAttribute("vo", vo);
		
		return MyCommon.USER_VIEW_PATH + "userLeave_form.jsp";
	}
	
	// 회원탈퇴
	@RequestMapping("/userLeave.do")
	public String userLeave(String uidx) {
		int res = user_dao.userDelete(uidx);
		
		return "";
	}
}


























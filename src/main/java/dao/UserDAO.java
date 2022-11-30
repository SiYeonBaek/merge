package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.MyPageVO;
import vo.ProductVO;
import vo.UserVO;

@Repository("user_dao")
public class UserDAO {

	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		System.out.println("userdao 생성자 생성");
		this.sqlSession = sqlSession;
	}
	
	// 아이디 중복체크 & 로그인 확인 & 아이디 찾기
	public UserVO id_check_selectOne(String uId) {
		UserVO vo = sqlSession.selectOne("u.id_check_selectOne", uId);
		// vo.setUpwd(vo.getUpwd());
		return vo;
	}
	
	// 한명 아이디 조회
	public UserVO user_selectOne(String uidx) {
		UserVO vo = sqlSession.selectOne("u.user_selectOne", uidx);
		return vo;
	}
	
	// 회원가입(insert)
	public int user_insert(UserVO vo) {
		int res = sqlSession.insert("u.user_insert", vo);
		return res;
	}
	
	// 아이디 찾기
	public UserVO find_id_selectOne(UserVO vo) {
		UserVO user = sqlSession.selectOne("u.find_id_selectOne", vo);
		
		return user;
	}
	
	// 비밀번호 찾기
	public UserVO find_pwd_selectOne(UserVO vo) {
		UserVO user = sqlSession.selectOne("u.find_pwd_selectOne", vo);
		
		return user;
	}
	
	// 비밀번호 찾기 -> 변경
	public int change_pwd(UserVO vo) {
		int res = sqlSession.update("u.change_pwd", vo);
		
		return res;
	}
	
	// 주문자 정보 예약 전체 저회
	public List<MyPageVO> OrderSelectList(String uidx) {
		List<MyPageVO> list = sqlSession.selectList("u.Order_list", uidx);
		return list;
	}
	
	// 회원정보 수정
	public int userModify(UserVO vo) {
		int res = sqlSession.update("u.userModify", vo);
		
		return res;
	}
	
	// 회원정보 수정 -> 비밀번호 변경
	public int changePwd(UserVO vo) {
		int res = sqlSession.update("u.changePwd", vo);
		return res;
	}
	
	// 회원탈퇴
	public int userDelete(String uidx) {
		int res = sqlSession.delete("u.userDelete", uidx);
		return res;
	}
	
	// 관리자페이지 회원관리
	public List<UserVO> selectList() {
		List<UserVO> list = sqlSession.selectList("u.memManage_list");
		
		return list;
	}
	
}
























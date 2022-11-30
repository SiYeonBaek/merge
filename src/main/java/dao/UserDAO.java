package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.ContactVO;
import vo.ProductVO;
import vo.UserVO;

@Repository("user_dao")
public class UserDAO {

	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		System.out.println("userdao 생성자 생성");
		this.sqlSession = sqlSession;
	}
	
	// 유저 리스트
	public List<UserVO> selectList() {
		List<UserVO> list = sqlSession.selectList("u.memManage_list");
		return list;
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
	
	// 마이페이지 -> 문의내역불러오기
	public List<ContactVO> contactList(String uid) {
		List<ContactVO> contactList = sqlSession.selectList("u.contact_list", uid);
		return contactList;
	}
	
	// 마이페이지 -> 상품내역불러오기
	public List<ProductVO> productList(String uidx) {
		List<ProductVO> productList = sqlSession.selectList("u.product_List", uidx);
		return productList;
	}
	
	// 마이페이지 -> 찜내역불러오기
	public List<ProductVO> likeList(String uid) {
		List<ProductVO> likeList = sqlSession.selectList("u.like_list", uid);
		return likeList;
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
	
	// 회원탈퇴하면 문의게시판의 게시글 전부 삭제
	public int userContactBoardDelete(String uid) {
		int res = sqlSession.delete("u.userContactDelete", uid);
		return res;
	}
	
	// 문의게시판 리스트 불러오기
	public List<ContactVO> contactSelectList(HashMap<String, Integer> map) {
		List<ContactVO> list = null;
		list = sqlSession.selectList("u.contactSelect", map);
		return list;
	}
	
	// 문의게시판 게시물 수 조회
	public int getRowTotal() {
		int count = sqlSession.selectOne("u.contact_count");
		return count;
	}
	
	// 문의게시판 게시물 등록
	public int contactBoard_insert(ContactVO vo) {
		int res = sqlSession.insert("u.contactBoard_insert", vo);
		return res;
	}
	
	// 문의게시판 한개 상세조회
	public ContactVO contactBoard_select_one(String cidx) {
		ContactVO vo = sqlSession.selectOne("u.contactSelectOne", cidx);
		return vo;
	}
	
	// 문의게시판 수정
	public int contactBoard_update(ContactVO vo) {
		int res = sqlSession.update("u.contactUpdate", vo);
		return res;
	}
	
}
























package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.ProductVO;
import vo.UserVO;

@Repository("admin_dao")
public class AdminDAO {
	
	SqlSession sqlSession;
	
	public AdminDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

}

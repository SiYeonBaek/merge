package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseStatus;

import vo.ProductVO;

@Repository("product_dao")
public class ProductDAO {
	
	SqlSession sqlSession;

	public ProductDAO(SqlSession sqlSession) {
		System.out.println("-----product 생성자 생성");
		this.sqlSession = sqlSession;
	}
	
	// 여행상품 조회
	public List<ProductVO> selectList() {
		List<ProductVO> list = sqlSession.selectList("p.product_list");
		
		return list;
	}
	
	// 여행상품 추가
	public int insert(ProductVO vo) {
		int res = sqlSession.insert("p.product_insert", vo);

		return res;
	}
	
	// 여행상품 삭제
	public int delete(String idx) {
		int pidx = Integer.parseInt(idx);
		int res = sqlSession.delete("p.product_delete", pidx);
			
		return res;
	}
	
	// 여행상품 수정을 위한 조건
	public ProductVO selectOne(String pidx) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@상품수정 한개 데이터 조회 DAO확인중");
		System.out.println(pidx);
		ProductVO vo = sqlSession.selectOne("p.product_one", pidx);
		
		return vo;
	}
	
	// 여행상품 수정하기
	public int update(ProductVO vo) {
		System.out.println(vo.getPidx());
		
		int res = sqlSession.update("p.product_update", vo);
		
		return res;
	}
	
}

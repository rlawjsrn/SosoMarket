package home;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tbk.prj.mypage.MypageLikeVO;
import com.tbk.prj.prod.ProdVO;

import common.DAO;

public class HomeDAO extends DAO {
	// 메인 화면 8개 상품 전체 조회
	public List<ProdVO> getHomeList() {
		connect();
		List<ProdVO> list = new ArrayList<>();
		String sql = "select p.product_id, c.category_name, p.product_name, TO_CHAR(p.product_price,'FM999,999,999,999')as product_price, pp.product_photo_name\r\n"
				+ "From product p, product_photo pp, category c\r\n"
				+ "Where substr(pp.product_photo_name,1,6) = p.product_id\r\n"
				+ "And substr(p.product_id,1,2) = c.category_id\r\n"
				+ "And substr(pp.product_photo_name,7,6) = 'fl0001'\r\n"
				+ "And rownum <= 8 order by substr(p.product_id,3,4) desc";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setProdId(rs.getString("product_id"));
				vo.setCategoryName(rs.getString("category_name"));
				vo.setProdName(rs.getString("product_name"));
				vo.setProdPrice(rs.getString("product_price"));
				vo.setProdPhotoName(rs.getString("product_photo_name"));

				list.add(vo);
				System.out.println("vo:" + vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	// 메인 화면 상품 상세 조회

	public ProdVO homeOne(String memberId ,String prodId) {
		ProdVO vo = new ProdVO();
		connect();
		String sql = "SELECT" + "p.product_id," + "p.product_name,"
				+ "TO_CHAR(p.product_price,'FM999,999,999,999')as product_price," + "p.product_status,"
				+ "p.product_views," + "p.product_description," + "p.generation_date," + "c.category_name,"
				+ "pi.product_interest_id," + "member.member_id"
				+ "FROM product p, category c, product_interest pi, member m"
				+ "WHERE substr(p.product_id,1,2) = c.category_id" + "AND p.product_id = pi.product_id"
				+ "AND p.member_id = m.member_id" // 변수 지정
				+ "AND p.product_id = 'dd0001'"; // 변수 지정
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			vo.setProdId(rs.getString("prodId"));
			vo.setProdName(rs.getString("prodName"));
			vo.setProdPrice(rs.getString("prodPrice"));
			vo.setProdStatus(rs.getString("prodStatus"));
			vo.setProdViews(rs.getInt("prodViews"));
			vo.setProdDscrp(rs.getString("prodDscrp"));
			vo.setProdGenerationDate(rs.getDate("prodGenerationDate"));
			vo.setCategoryId(rs.getString("categoryId"));
			vo.setProdInterestId(rs.getString("prodInterestId")); 
			vo.setMemberId(rs.getString("memberId"));
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
		return vo;
	}

	// product_id + product_photo_name 쿼리

	public ProdVO homeFile(String prodId) {

		connect();
		String sql = "SELECT" + "p.product_id," + "ph.product_photo_name" + "FROM product p, product_photo ph"
				+ "WHERE p.product_id = substr(ph.product_photo_name,1,6)" + "AND p.product_id = 'dd0001'"; // 변수지정

		ProdVO homeFile = new ProdVO();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setProdId(rs.getString("prodId"));
				vo.setProdPhotoName(rs.getString("prodPhotoName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}

		return homeFile;

	}
}

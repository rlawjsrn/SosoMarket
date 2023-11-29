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
				System.out.println("메인전체화면vo:" + vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	// 메인 화면 상품 상세 조회

	public ProdVO HomeOne(String prodId) {
		ProdVO vo = null;
		try {
			connect();
			String sql = "SELECT p.product_id, c.category_name, p.product_name, p.product_status, TO_CHAR(p.product_price, 'FM999,999,999,999') as product_price, p.product_views, p.product_description, p.generation_date, p.place_transaction, p.member_id\r\n"
					+ "FROM product p, category c\r\n" + "WHERE SUBSTR(p.product_id,1,2) = c.category_id\r\n"
					+ "AND product_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, prodId);
			rs = psmt.executeQuery();

			if (rs.next()) {
				System.out.println("if문까지 들어왔니?");
				vo = new ProdVO();
				vo.setProdId(rs.getString("product_id"));
				vo.setCategory(rs.getString("category_name"));
				vo.setProdName(rs.getString("product_name"));

				if (rs.getString("product_status").equals("0")) {
					vo.setProdStatus("판매중");
				} else if (rs.getString("product_status").equals("1")) {
					vo.setProdStatus("거래완료");
				} else {
					vo.setProdStatus("예약중");
				}
				vo.setProdPrice(rs.getString("product_price"));
				vo.setProdViews(rs.getInt("product_views"));
				vo.setProdDscrp(rs.getString("product_description"));
				vo.setProdGenerationDate(rs.getDate("generation_date"));
				vo.setPlaceTrans(rs.getString("place_transaction"));
				vo.setMemberId(rs.getString("member_id"));
				System.out.println("한 건 조회 VO: " + vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return vo;
	}

	// product_id + product_photo_name 쿼리

	// 상품 한 건 조회(상품 사진)
	public ArrayList<ProdVO> homeOnePhotoList(String prodId) {
		ArrayList<ProdVO> list = new ArrayList<>();
		try {
			connect();
			String sql = "SELECT pp.product_photo_name\r\n" + "FROM product_photo pp, product p\r\n"
					+ "WHERE substr(pp.product_photo_name,1,6) = p.product_id\r\n" + "AND p.product_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, prodId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setProdPhotoName(rs.getString("product_photo_name"));
				list.add(vo);
				System.out.println("사진 조회: " + list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	

}

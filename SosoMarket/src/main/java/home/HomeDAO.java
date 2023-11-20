package home;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tbk.prj.prod.ProdVO;

import common.DAO;

public class HomeDAO extends DAO{
	// 메인 화면 8개 상품 전체 조회
	public List<ProdVO> getHomeList() {
		connect();
		List<ProdVO> list = new ArrayList<>();
		String sql = "select p.product_id, c.category_name, p.product_name, TO_CHAR(p.product_price,'FM999,999,999,999')as product_price, pp.product_photo_id" 
		+ "From product p, product_photo pp, category c"  
		+ "Where substr(pp.product_photo_name,1,6) = p.product_id"
		+ "And substr(p.product_id,1,2) = c.category_id"
		+ "And substr(pp.product_photo_name,7,6) = 'fl0001'"
		+ "And rownum <= 8 order by substr(p.product_id,3,4) desc";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setProdId(rs.getString("prodId"));
				vo.setProdName(rs.getString("prodName"));
				vo.setProdPrice(rs.getString("prodPrice"));
				vo.setProdPhotoName(rs.getString("prodPhotoName"));
				
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
	
	public ProdVO homeOne(String prodId) {
		
		connect();
		String sql = "SELECT"+""
				+ "product.product_id,"	
				+"product.product_name,"
				+"TO_CHAR(product.product_price,'FM999,999,999,999')as product_price,"
				+"product.product_status,"
				+"product.product_views,"
				+"product.product_description,"
				+"product.generation_date,"
				+"category.category_name,"
				+"product_interest.product_interest_id,"
				+"chat.chat_id,"
				+"product_photo.product_photo_id,"
				+"member.member_id"
				+"FROM"
				+"";
				// group by 절이 필요한가?
		
		return null;
		
	}
	
}	

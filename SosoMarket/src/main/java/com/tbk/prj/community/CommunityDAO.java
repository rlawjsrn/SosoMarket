package com.tbk.prj.community;

import java.util.Date;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.DAO;

public class CommunityDAO extends DAO {
	// Retrieve all posts
	private final String CommunityPostList1 = "SELECT * FROM community ORDER BY generation_date DESC";

	public ArrayList<CommunityVO> getAllPosts() {
		ArrayList<CommunityVO> posts = new ArrayList<CommunityVO>();
		CommunityVO post;
		try {
			connect();
			psmt = conn.prepareStatement(CommunityPostList1);
			rs = psmt.executeQuery();
			while (rs.next()) {
				post = new CommunityVO();
				post.setPostId(rs.getString("post_id"));
				post.setPostTitle(rs.getString("post_title"));
				post.setMemberId(rs.getString("member_id"));
				post.setPostDetail(rs.getString("post_detail"));
				post.setPostViews(rs.getInt("post_views"));
				post.setGenerationDate(rs.getString("generation_date"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return posts;
	}

	private final String CommunityPostList = "SELECT post_id, post_title, member_id, post_detail, post_views, TO_CHAR(generation_date, 'YY/MM/DD HH24:MM:SS') as generation_date \r\n"
			+ "FROM community \r\n" + "ORDER BY post_views desc";

	// Modify the method to accept a sortOption parameter
	public ArrayList<CommunityVO> getAllPostsSorted(String sortOption) {
		ArrayList<CommunityVO> posts = new ArrayList<CommunityVO>();
		CommunityVO post;
		try {
			connect();
			// Adjust the SQL query based on the sortOption
			String sql = CommunityPostList;
			if ("1".equals(sortOption)) {
				sql = "SELECT post_id, post_title, member_id, post_detail, post_views, TO_CHAR(generation_date, 'YY/MM/DD HH24:MM:SS') as generation_date\r\n"
						+ "FROM community \r\n" + "ORDER BY generation_date desc";
			} else if ("2".equals(sortOption)) {
				sql = "SELECT post_id, post_title, member_id, post_detail, post_views, TO_CHAR(generation_date, 'YY/MM/DD HH24:MM:SS') as generation_date\r\n"
						+ "FROM community \r\n" + "ORDER BY generation_date";
			}
			System.out.println("Generated SQL: " + sql); // Debugging statement

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				post = new CommunityVO();
				post.setPostId(rs.getString("post_id"));
				post.setPostTitle(rs.getString("post_title"));
				post.setMemberId(rs.getString("member_id"));
				post.setPostDetail(rs.getString("post_detail"));
				post.setPostViews(rs.getInt("post_views"));
				post.setGenerationDate(rs.getString("generation_date"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return posts;
	}

	private final String CommunitySearchResults = "SELECT * FROM community WHERE " + "post_title LIKE ? OR "
			+ "post_detail LIKE ? OR " + "post_id LIKE ? OR " + "(TO_CHAR(generation_date, 'YYYY-MM-DD') = ?) OR "
			+ "member_id LIKE ?";

	// Modify the method to accept a sortOption parameter
	public ArrayList<CommunityVO> searchPostsByTitle(String searchQuery, String sortOption) {
		ArrayList<CommunityVO> searchResults = new ArrayList<CommunityVO>();
		try {
			connect();
			// Adjust the SQL query based on the sortOption
			String sql = CommunitySearchResults;
			if ("1".equals(sortOption)) {
				sql += " ORDER BY generation_date DESC";
			} else if ("2".equals(sortOption)) {
				sql += " ORDER BY generation_date ASC";
			} else if ("3".equals(sortOption)) {
				sql += " ORDER BY post_views DESC";
			}

			psmt = conn.prepareStatement(sql);
			String keyword = "%" + searchQuery + "%";
			psmt.setString(1, keyword);
			psmt.setString(2, keyword);
			psmt.setString(3, keyword);
			psmt.setString(4, keyword);
			psmt.setString(5, keyword);

			rs = psmt.executeQuery();
			while (rs.next()) {
				CommunityVO post = new CommunityVO();
				post.setPostId(rs.getString("post_id"));
				post.setPostTitle(rs.getString("post_title"));
				post.setMemberId(rs.getString("member_id"));
				post.setPostDetail(rs.getString("post_detail"));
				post.setPostViews(rs.getInt("post_views"));
				post.setGenerationDate(rs.getString("generation_date"));
				searchResults.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return searchResults;
	}

	// Create a new post
	public CommunityVO createPost(CommunityVO post) {
		try {
			connect();

			// SQL statement to insert a new post using the sequence for post_id
			String sql = "INSERT INTO community (post_id, post_title, post_detail, member_id, generation_date, post_views) "
					+ "VALUES ('co' || LPAD(postSeq.nextval, 4, '0'), ?, ?, ?, TO_DATE(TO_CHAR(sysdate, 'YY/MM/DD HH24:MI:SS'), 'YY/MM/DD HH24:MI:SS'), 0)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, post.getPostTitle());
			psmt.setString(2, post.getPostDetail());
			psmt.setString(3, post.getMemberId());
//            psmt.setString(4, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			psmt.executeUpdate();

			return post;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return null;
	}

	// Checking if a user is authenticated before allowing them to create posts.
	// Associating posts with the member who created them.
	// Handling user sessions and ensuring that user information is associated with
	// the posts they create.
	// Checking if a user is authenticated before allowing them to create posts.
	// Associating posts with the member who created them.
	// Handling user sessions and ensuring that user information is associated with
	// the posts they create.

	// Retrieve a post by its post_id
	public CommunityVO getPostById(String postId) {
		CommunityVO post = null;
		try {
			connect();
			String sql = "SELECT * FROM community WHERE post_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, postId);
			rs = psmt.executeQuery();
			if (rs.next()) {
				post = new CommunityVO();
				post.setPostId(rs.getString("post_id"));
				post.setPostTitle(rs.getString("post_title"));
				post.setMemberId(rs.getString("member_id"));
				post.setPostDetail(rs.getString("post_detail"));
				post.setPostViews(rs.getInt("post_views"));
				post.setGenerationDate(rs.getString("generation_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return post;
	}

	// Update a post
	public boolean updatePost(CommunityVO post) {
		try {
			connect();

			String sql = "UPDATE community SET post_title=?, post_detail=? WHERE post_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, post.getPostTitle());
			psmt.setString(2, post.getPostDetail());
			psmt.setString(3, post.getPostId());

			int rowsAffected = psmt.executeUpdate();

			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}

	// Delete a post
	public boolean deletePost(String postId) {
		try {
			connect();

			String sql = "DELETE FROM community WHERE post_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, postId);

			int rowsAffected = psmt.executeUpdate();

			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}

	// Retrieve all comments for a post
	private final String CommentsByPostIdQuery = "SELECT * FROM comm WHERE post_id= ? AND cmt_pos=0 ORDER BY generation_date DESC";

	public ArrayList<CommVO> getCommentsByPostId(String postId) {
		ArrayList<CommVO> comments = new ArrayList<>();
		CommVO comment;
		try {
			connect();
			psmt = conn.prepareStatement(CommentsByPostIdQuery);
			psmt.setString(1, postId);
			rs = psmt.executeQuery();
			while (rs.next()) {
				comment = new CommVO();
				comment.setCommId(rs.getInt("comm_id"));
				comment.setCmtRef(rs.getInt("cmt_ref"));
				comment.setCmtPos(rs.getInt("cmt_pos"));
				comment.setPostId(rs.getString("post_id"));
				comment.setMemberId(rs.getString("member_id"));
				comment.setGenerationDate(rs.getDate("generation_date"));
				comment.setCommentDetail(rs.getString("comment_detail"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return comments;
	}

	// Retrieve replies for a comment
	private final String RepliesByCommentIdQuery = "SELECT * FROM comm WHERE cmt_ref=? AND cmt_pos>0  ORDER BY cmt_pos ASC, generation_date ASC";

	public ArrayList<CommVO> getRepliesByCommentId(int commId) {
		ArrayList<CommVO> replies = new ArrayList<>();
		CommVO reply;
		try {
			connect();
			psmt = conn.prepareStatement(RepliesByCommentIdQuery);
			psmt.setInt(1, commId);
			rs = psmt.executeQuery();
			while (rs.next()) {
				reply = new CommVO();
				reply.setCommId(rs.getInt("comm_id"));
				reply.setCmtRef(rs.getInt("cmt_ref"));
				reply.setCmtPos(rs.getInt("cmt_pos"));
				reply.setPostId(rs.getString("post_id"));
				reply.setMemberId(rs.getString("member_id"));
				reply.setGenerationDate(rs.getDate("generation_date"));
				reply.setCommentDetail(rs.getString("comment_detail"));
				replies.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return replies;
	}

	// Retrieve a comment by its comm_id
	public CommVO getCommentById(int commId) {
		CommVO comm = null;
		try {
			connect();
			String sql = "SELECT * FROM comm WHERE comm_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commId);
			rs = psmt.executeQuery();
			if (rs.next()) {
				comm = new CommVO();
				comm.setCommId(rs.getInt("comm_id"));
				comm.setCmtRef(rs.getInt("cmt_ref"));
				comm.setCmtPos(rs.getInt("cmt_pos"));
				comm.setMemberId(rs.getString("member_id"));
				comm.setCommentDetail(rs.getString("comment_detail"));
				comm.setGenerationDate(rs.getDate("generation_date"));
				System.out.println(comm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return comm;
	}

	// Create a new comment
	public CommVO createComment(CommVO comment) {
		try {
			connect();

			String sql;
			int cmtPos;

			if (comment.getCmtRef() > 0) {
				// If comm_ref is present, it's a reply
				String posQuery = "SELECT NVL(MAX(cmt_pos), 0) + 1 FROM comm WHERE cmt_ref = ?";
				try (PreparedStatement posPsmt = conn.prepareStatement(posQuery)) {
					posPsmt.setInt(1, comment.getCmtRef());
					try (ResultSet resultSet = posPsmt.executeQuery()) {
						if (resultSet.next()) {
							cmtPos = resultSet.getInt(1);
						} else {
							// Handle error or set a default value
							cmtPos = 0;
						}
					}
				}

				// SQL statement to insert a new comment
				sql = "INSERT INTO comm (comm_id,cmt_ref,cmt_pos, post_id, member_id, generation_date, comment_detail) "
						+ "VALUES (cmtSeq.nextval,?,?,?, ?, current_timestamp, ?)";

				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, comment.getCmtRef());
				psmt.setInt(2, cmtPos);
				psmt.setString(3, comment.getPostId());
				psmt.setString(4, comment.getMemberId());
				psmt.setString(5, comment.getCommentDetail());
				System.out.println("SQL Query: " + sql);

			} else {
				// If comm_ref is null, it's a top-level comment
				int pos = 0;
				sql = "INSERT INTO comm (comm_id, cmt_ref, cmt_pos, post_id, member_id, generation_date, comment_detail) "
						+ "VALUES( cmtSeq.nextval, cmtSeq.currval, ?, ?, ?, current_timestamp, ?)";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, pos);
				psmt.setString(2, comment.getPostId());
				psmt.setString(3, comment.getMemberId());
				psmt.setString(4, comment.getCommentDetail());
			}

			int r = psmt.executeUpdate();
			System.out.println(r + "건 입력.");

			return comment;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return null;
	}

	// Update Comment
	public boolean updateComment(CommVO comment) {
		try {
			connect();

			// Update the comment_detail and generation_date
			String updateSql = "UPDATE comm SET comment_detail=?, generation_date=current_timestamp WHERE comm_id=?";
			psmt = conn.prepareStatement(updateSql);
			psmt.setString(1, comment.getCommentDetail());
			psmt.setInt(2, comment.getCommId());

			int rowsAffected = psmt.executeUpdate();

			if (rowsAffected > 0) {
				System.out.println("Comment updated successfully");
				return true;
			} else {
				System.out.println("Failed to update comment. No rows affected.");
				return false;
			}

		} catch (SQLException e) {
			System.out.println("Error updating comment: " + e.getMessage());
			e.printStackTrace();
			throw new RuntimeException("Error updating comment", e);
		} finally {
			disconnect();
		}
	}

	// Delete a comment
	public boolean deleteComment(int commId, boolean isReply) {
		try {
			connect();
			String deleteSql;

			if (isReply) {
				// Delete a reply
				deleteSql = "DELETE FROM comm WHERE comm_id=?";
			} else {
				// Delete a top-level comment
				deleteSql = "DELETE FROM comm WHERE cmt_ref=?";
			}
			System.out.println("Delete SQL: " + deleteSql);
			psmt = conn.prepareStatement(deleteSql);
			psmt.setInt(1, commId);

			System.out.println("Deleting comment - comm_id: " + commId);

			int rowsAffected = psmt.executeUpdate();

			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}

}
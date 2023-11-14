package com.tbk.prj.community;

import java.util.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.DAO;

public class CommunityDAO extends DAO {
	// Retrieve all posts
    private final String CommunityPostList= "SELECT * FROM community ORDER BY generation_date DESC";
    
    public ArrayList<CommunityVO> getAllPosts() {
        ArrayList<CommunityVO> posts = new ArrayList<CommunityVO>();
       CommunityVO post;
        try {
            connect();
           psmt=conn.prepareStatement(CommunityPostList);
            rs = psmt.executeQuery();
            while (rs.next()) {
            	post=new CommunityVO(); 
                post.setPostId(rs.getString("post_id"));
                post.setPostTitle(rs.getString("post_title"));
                post.setMemberId(rs.getString("member_id"));
                post.setPostDetail(rs.getString("post_detail"));
                post.setPostViews(rs.getInt("post_views"));
                post.setGenerationDate(rs.getDate("generation_date"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return posts;
    }
    
    
 // Search posts by keyword in both title and detail
    private final String CommunitySearchResults="SELECT * FROM community WHERE " +
            "post_title LIKE ? OR " +
            "post_detail LIKE ? OR " +
            "post_id LIKE ? OR " +
            "(TO_CHAR(generation_date, 'YYYY-MM-DD') LIKE ?) OR " +
            "member_id LIKE ?";
    
    public ArrayList<CommunityVO> searchPostsByTitle(String searchQuery) {
        ArrayList<CommunityVO> searchResults = new ArrayList<CommunityVO>();
        try {
            connect();
            psmt = conn.prepareStatement(CommunitySearchResults);
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
                post.setGenerationDate(rs.getDate("generation_date"));
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
    public boolean createPost(CommunityVO post) {
        try {
            connect();

            // SQL statement to insert a new post using the sequence for post_id
            String sql = "INSERT INTO community (post_id, post_title, post_detail, member_id, generation_date, post_views) " +
                    "VALUES ('co' || LPAD(postSeq.nextval, 4, '0'), ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), 0)";

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, post.getPostTitle());
            psmt.setString(2, post.getPostDetail());
            psmt.setString(3, post.getMemberId());
            psmt.setString(4, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            psmt.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return false;
    }
     
    //Checking if a user is authenticated before allowing them to create posts.
    //Associating posts with the member who created them.
    //Handling user sessions and ensuring that user information is associated with the posts they create.
    //Checking if a user is authenticated before allowing them to create posts.
    //Associating posts with the member who created them.
    //Handling user sessions and ensuring that user information is associated with the posts they create.


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
                post.setGenerationDate(rs.getDate("generation_date"));
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

    
    // Retrieve posts with pagination
    public ArrayList<CommunityVO> getPostsWithPagination(int page, int postsPerPage) {
        ArrayList<CommunityVO> posts = new ArrayList<>();
        try {
            connect();
            int startRow = (page - 1) * postsPerPage + 1;
            int endRow = startRow + postsPerPage - 1;

            String sql = "SELECT * FROM " +
                    "(SELECT ROWNUM AS rnum, c.* FROM " +
                    "(SELECT * FROM community ORDER BY generationDate DESC) c) " +
                    "WHERE rnum BETWEEN ? AND ?";
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, startRow);
            psmt.setInt(2, endRow);
            rs = psmt.executeQuery();

            while (rs.next()) {
                CommunityVO post = new CommunityVO();
                post.setPostId(rs.getString("post_id"));
                post.setPostTitle(rs.getString("post_title"));
                post.setMemberId(rs.getString("member_id"));
                post.setPostDetail(rs.getString("post_detail"));
                post.setPostViews(rs.getInt("post_views"));
                post.setGenerationDate(rs.getTimestamp("generationDate"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return posts;
    }
}
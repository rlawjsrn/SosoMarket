package com.tbk.prj.community;

import common.DAO;

import java.sql.SQLException;
import java.util.ArrayList;

public class CommunityDAO extends DAO {
    // Create a new post
    public int createPost(CommunityVO post) {
        int result = 0;
        try {
            connect();
            String sql = "INSERT INTO community(post_id, post_title, member_id, post_detail, post_views, generationDate) VALUES(?, ?, ?, ?, ?, ?)";
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, post.getPostId());
            psmt.setString(2, post.getPostTitle());
            psmt.setString(3, post.getMemberId());
            psmt.setString(4, post.getPostDetail());
            psmt.setInt(5, post.getPostViews());
            psmt.setTimestamp(6, new java.sql.Timestamp(post.getGenerationDate().getTime()));
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }

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
                post.setGenerationDate(rs.getTimestamp("generationDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return post;
    }

    // Update an existing post
    public int updatePost(CommunityVO post) {
        int result = 0;
        try {
            connect();
            String sql = "UPDATE community SET post_title=?, post_detail=?, post_views=? WHERE post_id=?";
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, post.getPostTitle());
            psmt.setString(2, post.getPostDetail());
            psmt.setInt(3, post.getPostViews());
            psmt.setString(4, post.getPostId());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }

    // Delete a post by its post_id
    public int deletePost(String postId) {
        int result = 0;
        try {
            connect();
            String sql = "DELETE FROM community WHERE post_id=?";
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, postId);
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }

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
    public ArrayList<CommunityVO> searchPostsByTitle(String searchQuery) {
        ArrayList<CommunityVO> searchResults = new ArrayList<CommunityVO>();
        try {
            connect();
            String sql = "SELECT * FROM community WHERE post_title LIKE ? OR post_detail LIKE ?  OR post_id LIKE ?  OR generation_date LIKE ?  OR member_id LIKE ?";
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
package com.tbk.prj.community;


import java.util.Date; 


public class CommunityVO {
    private String postId;
    private String postTitle;
    private String member_id; 
    private String postDetail;
    private int postViews;
    private Date generationDate;


    public String getPostId() {
        return postId;
    }


    public void setPostId(String postId) {
        this.postId = postId;
    }


    public String getPostTitle() {
        return postTitle;
    }


    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }


    public String getMemberId() {
        return member_id;
    }


    public void setMemberId(String member_id) {
        this.member_id = member_id;
    }


    public String getPostDetail() {
        return postDetail;
    }


    public void setPostDetail(String postDetail) {
        this.postDetail = postDetail;
    }


    public int getPostViews() {
        return postViews;
    }


    public void setPostViews(int postViews) {
        this.postViews = postViews;
    }


    public Date getGenerationDate() {
        return generationDate;
    }


    public void setGenerationDate(Date generationDate) {
        this.generationDate = generationDate;
    }
}
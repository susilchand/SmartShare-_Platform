package model;

import java.security.Timestamp;

public class Post {
    private String title;
    private String content;
    private String category;
    private int storyId;
    private int userId;
    private String postImgUrl;
    private String visibility;
	private java.sql.Timestamp createdAt;
	private  String name;
	private String email;
	private String password;
	private int id;
	private String bio;
	private String avatarImg;
	private int like_count;
	private int favorite_count;
	public boolean isFavoritedByCurrentUser() {
		return favoritedByCurrentUser;
	}
	public void setFavoritedByCurrentUser(boolean favoritedByCurrentUser) {
		this.favoritedByCurrentUser = favoritedByCurrentUser;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getFavoriteCount() {
		return favoriteCount;
	}
	public void setFavoriteCount(int favoriteCount) {
		this.favoriteCount = favoriteCount;
	}
	public boolean isLikedByCurrentUser() {
		return likedByCurrentUser;
	}
	public void setLikedByCurrentUser(boolean likedByCurrentUser) {
		this.likedByCurrentUser = likedByCurrentUser;
	}
	boolean favoritedByCurrentUser;
	private int likeCount;
	private int favoriteCount;
	private boolean likedByCurrentUser;
    
    


	public Post(String title, String content, String category, int storyId, int userId, String postImgUrl,
			String visibility, java.sql.Timestamp createdAt) {
		super();
		this.title = title;
		this.content = content;
		this.category = category;
		this.storyId = storyId;
		this.userId = userId;
		this.postImgUrl = postImgUrl;
		this.visibility = visibility;
		this.createdAt = createdAt;
	}
	public Post(Integer userId2, String title2, String content2, String category2, String imgUrl) {
	this.userId=userId2;
	this.title=title2;
	this.content=content2;
	this.category=category2;
	this.postImgUrl=imgUrl;
	}
	public Post(int postId1, String title2, String content2, String category2,String visibility2, String postImgUrl2) {
		this.storyId=postId1;
		this.title=title2;
		this.content=content2;
		this.category=category2;
		this.visibility=visibility2;
		this.postImgUrl=postImgUrl2;	
	}

	public Post(String title2, String content2, String category2, String visibility2, String postImgUrl2) {
		// TODO Auto-generated constructor stub
	}
	public Post(int postId, String title, String content, String category, String visibility, String postImgUrl,
            int userId, String username, String userAvatarUrl, java.sql.Timestamp createdAt) {
    this.storyId = postId;
    this.title = title;
    this.content = content;
    this.category = category;
    this.visibility = visibility;
    this.postImgUrl = postImgUrl;
    this.userId = userId;
    this.name = username;
    this.avatarImg = userAvatarUrl;
    this.createdAt = createdAt;
   
}


	public Post(int postId, String title2, String content2, String category2, String visibility2, String storyImgUrl,
			String username, String imgUrl, java.sql.Timestamp date) {
	    this.storyId = postId;
	    this.title = title2;
	    this.content = content2;
	    this.category = category2;
	    this.visibility = visibility2;
	    this.postImgUrl = storyImgUrl;
	  
	    this.name = username;
	    this.avatarImg = imgUrl;
	    this.createdAt = date;
	}
	public Post(int postId, String title2, String content2, String category2, String visibility2, String storyImgUrl,
			int userId2, String username, String imgUrl, boolean favoritedByCurrentUser) {
	     this.storyId = postId;
	        this.title = title2;
	        this.content = category2;
	        this.category = category2;
	        this.visibility = visibility2;
	        this.postImgUrl = storyImgUrl;
	        this.userId = userId2;
	        this.name = username;
	        this.avatarImg = imgUrl;
	        this.favoritedByCurrentUser = favoritedByCurrentUser;
	}

    public Post(int postId, String title, String content,String bio, String category, String visibility, String storyImgUrl, int userId, String username, String userAvatarUrl, int likeCount, int favoriteCount, boolean likedByCurrentUser, boolean favoritedByCurrentUser,java.sql.Timestamp createdAt) {
        this.storyId = postId;
        this.title = title;
        this.content = content;
        this.bio=bio;
        this.category = category;
        this.visibility = visibility;
        this.postImgUrl = storyImgUrl;
        this.userId = userId;
        this.name = username;
        this.avatarImg = userAvatarUrl;
        this.likeCount = likeCount;
        this.favoriteCount = favoriteCount;
        this.likedByCurrentUser = likedByCurrentUser;
        this.favoritedByCurrentUser = favoritedByCurrentUser;
        this.createdAt = createdAt;
    }
	public Post(int postId, String title, String content,String bio, String category, String visibility, String storyImgUrl, int userId, String username, String userAvatarUrl, int likeCount, int favoriteCount,java.sql.Timestamp createdAt) {
        this.storyId = postId;
        this.title = title;
        this.content = content;
        this.bio=bio;
        this.category = category;
        this.visibility = visibility;
        this.postImgUrl = storyImgUrl;
        this.userId = userId;
        this.name = username;
        this.avatarImg = userAvatarUrl;
        this.likeCount = likeCount;
        this.favoriteCount = favoriteCount;
        this.createdAt = createdAt;
	}
	public Post(int userId2, String username, String imgUrl, String email2,String bio) {
		this.userId=userId2;
		this.name=username;
		this.avatarImg=imgUrl;
		this.email=email2;
		this.bio=bio;
	}
	public Post(int postId, String title2, String content2, String category2, String visibility2, String storyImgUrl,
			java.sql.Timestamp date) {
		  this.storyId = postId;
	        this.title = title2;
	        this.content = content2;
	        this.category = category2;
	        this.visibility = visibility2;
	        this.postImgUrl = storyImgUrl;

	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStoryId() {
		return storyId;
	}
	public void setStoryId(int storyId) {
		this.storyId = storyId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPostImgUrl() {
		return postImgUrl;
	}
	public void setPostImgUrl(String postImgUrl) {
		this.postImgUrl = postImgUrl;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
    public java.sql.Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(java.sql.Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getAvatarImg() {
		return avatarImg;
	}
	public void setAvatarImg(String avatarImg) {
		this.avatarImg = avatarImg;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getFavorite_count() {
		return favorite_count;
	}
	public void setFavorite_count(int favorite_count) {
		this.favorite_count = favorite_count;
	}
	
}


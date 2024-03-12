package model;

public class User {
private  String name;
private String email;
private String password;
private int id;
private String bio;
private String avatarImg;



public User(String name, String email, String password, int id, String avatarImg,String bio) {
	super();
	this.name = name;
	this.email = email;
	this.password = password;
	this.id = id;
	this.avatarImg = avatarImg;
	this.bio=bio;
}
public User(int userId, String username, String email2, String imgUrl) {
	this.id=userId;
	this.name=username;
	this.email=email2;
	this.avatarImg=imgUrl;
	
}
public User(int userId, String username, String email2,String password, String imgUrl, String bio2) {
	this.id=userId;
	this.name=username;
	this.email=email2;
	this.password=password;
	this.avatarImg=imgUrl;
	this.bio=bio2;
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
public String getAvatarImg() {
	return avatarImg;
}
public void setAvatarImg(String avatarImg) {
	this.avatarImg = avatarImg;
}
public String getBio() {
	return bio;
}
public void setBio(String bio) {
	this.bio = bio;
}

}
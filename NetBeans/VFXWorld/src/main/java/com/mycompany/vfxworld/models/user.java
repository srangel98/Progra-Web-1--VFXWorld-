package com.mycompany.vfxworld.models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author 52811
 */
public class user {
        private String name;
        private String password;
        private String email;
        private String photo;
        private String userType;

    public user(String name, String password, String email) {
        this.name = name;
        this.password = password;
        
        this.email = email;
    }

    public user(String name, String password) {
        this.name = name;
        this.password = password;
    }
    
     public user(String name) {
        this.name = name;
    }

    public user(String name, String password, String email, String photo, String userType) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.photo = photo;
        this.userType = userType;
    }

    
    
    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoto() {
        return photo;
    }

    public String getUserType() {
        return userType;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
        
    
}
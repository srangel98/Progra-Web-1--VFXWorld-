/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.models;

/**
 *
 * @author 52811
 */
public class comment {
    private int id;
    private String body;
    private int rate;
    private boolean isAnon;
    private boolean isReply;
    private String nameUser;
    private int idNews;
    private String photoUser;

    public comment() {
    }

    public comment(int id, String body, int rate, boolean isAnon, boolean isReply, String nameUser, int idNews, String photoUser) {
        this.id = id;
        this.body = body;
        this.rate = rate;
        this.isAnon = isAnon;
        this.isReply = isReply;
        this.nameUser = nameUser;
        this.idNews = idNews;
        this.photoUser = photoUser;
    }

    public comment(String body, boolean isAnon, boolean isReply, String nameUser, int idNews, String photoUser) {
        this.body = body;
        this.isAnon = isAnon;
        this.isReply = isReply;
        this.nameUser = nameUser;
        this.idNews = idNews;
        this.photoUser = photoUser;
    }

    public String getPhotoUser() {
        return photoUser;
    }

    public void setPhotoUser(String photoUser) {
        this.photoUser = photoUser;
    }

    
    
    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public boolean getIsAnon() {
        return isAnon;
    }

    public void setIsAnon(boolean isAnon) {
        this.isAnon = isAnon;
    }

    public boolean getIsReply() {
        return isReply;
    }

    public void setIsReply(boolean isReply) {
        this.isReply = isReply;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public int getIdNews() {
        return idNews;
    }

    public void setIdNews(int idNews) {
        this.idNews = idNews;
    }
    
    
    
}

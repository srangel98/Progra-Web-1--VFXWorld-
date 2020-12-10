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
public class news {
    private int id;
    private String title;
    private String description;
    private String body;
    private String category;
    private int rate;
    private int approved;
    private String feedback;
    private String miniImage;
    private String headerImage;
    private String bodyImage;
    private String videos;
    private String autor;

    public news(){
        
    }
    
    public news(String title, String description, String body, String category, String videos, String miniImage, String headerImage, String bodyImage, String autor) {
        this.title = title;
        this.description = description;
        this.body = body;
        this.category = category;
        this.videos = videos;
        this.miniImage = miniImage;
        this.headerImage = headerImage;
        this.bodyImage = bodyImage;
        this.autor = autor;
    }

    public news(int id, String title, String description, String body, String category, int rate, int approved, String feedback, String miniImage, String headerImage, String bodyImage, String videos, String autor) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.body = body;
        this.category = category;
        this.rate = rate;
        this.approved = approved;
        this.feedback = feedback;
        this.miniImage = miniImage;
        this.headerImage = headerImage;
        this.bodyImage = bodyImage;
        this.videos = videos;
        this.autor = autor;
    }
    

    public String getMiniImage() {
        return miniImage;
    }

    public void setMiniImage(String miniImage) {
        this.miniImage = miniImage;
    }

    public String getHeaderImage() {
        return headerImage;
    }

    public void setHeaderImage(String headerImage) {
        this.headerImage = headerImage;
    }

    public String getBodyImage() {
        return bodyImage;
    }

    public void setBodyImage(String bodyImage) {
        this.bodyImage = bodyImage;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getApproved() {
        return approved;
    }

    public void setApproved(int approved) {
        this.approved = approved;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getVideos() {
        return videos;
    }

    public void setVideos(String videos) {
        this.videos = videos;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }
    
    
    
}

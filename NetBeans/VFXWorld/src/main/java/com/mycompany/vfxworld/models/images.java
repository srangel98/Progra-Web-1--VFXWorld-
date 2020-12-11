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
public class images {
    private int id;
    private String path;
    private String type;

    public images(int id, String path, String type) {
        this.id = id;
        this.path = path;
        this.type = type;
    }

    public int getId() {
        
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
    
    
    
}

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
public class creator {
    private int id;
    private String name;

    public creator(int id) {
        this.id = id;
    }

    public creator(String name) {
        
        this.name = name;
    }

    public creator(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}

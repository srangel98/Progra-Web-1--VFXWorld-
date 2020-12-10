/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.models;

//import java.sql.Timestamp;


/**
 *
 * @author 52811
 */
public class register {
    private int id;
    private String name;
    private int id_mod;
    private String suspendedTime;
    private String aboutMe;

    public register(String name, int id) {
        this.name = name;
        this.id = id;
    }

    public register(int id, String name, int id_mod, String suspendedTime, String aboutMe) {
        this.id = id;
        this.name = name;
        this.id_mod = id_mod;
        this.suspendedTime = suspendedTime;
        this.aboutMe = aboutMe;
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

    public int getId_mod() {
        return id_mod;
    }

    public void setId_mod(int id_mod) {
        this.id_mod = id_mod;
    }

    public String getSuspendedTime() {
        return suspendedTime;
    }

    public void setSuspendedTime(String suspendedTime) {
        this.suspendedTime = suspendedTime;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }
    
    
    
}

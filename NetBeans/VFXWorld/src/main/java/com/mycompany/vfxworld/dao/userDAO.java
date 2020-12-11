/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.dao;
import com.mycompany.vfxworld.models.register;
import com.mycompany.vfxworld.models.user;
import com.mycompany.vfxworld.utils.dbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author 52811
 */
public class userDAO {
    public static int signInUser(user User) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL insert_userRegistered(?, ?, ?);");
            statement.setString(1, User.getName());
            statement.setString(2, User.getPassword());
            statement.setString(3, User.getEmail());
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
    public static user logInUser(user User) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL logInUser(?,?)");
            statement.setString(1, User.getName());
            statement.setString(2, User.getPassword());
            ResultSet result = statement.executeQuery();
            while (result.next()){
                String name = result.getString("name");
                String password = result.getString("password");
                String photo = result.getString("photo");
                String email = result.getString("email");
                String userType = result.getString("userType");
                return new user(name, password, email, photo, userType);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public static user findModifyUser(String name) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL findModifyUser(?)");
            statement.setString(1, name);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                String modName = result.getString("name");
                String modPassword = result.getString("password");
                String modPhoto = result.getString("photo");
                String modEmail = result.getString("email");
                String modUserType = result.getString("userType");
                return new user(modName, modPassword, modPhoto, modEmail, modUserType);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public static int modifUserReg(String mName, int mReg_id, String mEmail, String mPhoto, String mAboutMe) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL modifUserReg(?, ?, ?, ?, ?)");
            statement.setString(1, mName);
            statement.setInt(2, mReg_id);
            
            statement.setString(3, mEmail);
            statement.setString(4, mPhoto);
            statement.setString(5, mAboutMe);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
}

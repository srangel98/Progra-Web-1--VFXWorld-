/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.dao;
import com.mycompany.vfxworld.models.user;
import com.mycompany.vfxworld.utils.dbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author 52811
 */
public class userDAO {
    public static int signInUser(user User) {
        try {
            Connection con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL insert_userRegistered(?, ?, ?);");
            statement.setString(1, User.getName());
            statement.setString(2, User.getPassword());
            statement.setString(3, User.getEmail());
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }
    
    public static user logInUser(user User) {
        try {
            Connection con = dbConnection.getConnection();
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
        }
        return null;
    }
}

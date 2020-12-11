/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.dao;

import com.mycompany.vfxworld.models.category;
import com.mycompany.vfxworld.utils.dbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 52811
 */
public class categoryDAO {
    public static List<category> getCategories() {
        Connection con = null;
        try {
            
            List<category> categories = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getAllCategories()");
            ResultSet result = statement.executeQuery();
            while (result.next()){
                String name = result.getString("name");
                
                categories.add(new category(name));
            }
            return categories;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(categoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(categoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
}

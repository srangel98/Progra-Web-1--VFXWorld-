/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.dao;

import com.mycompany.vfxworld.models.creator;
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
public class creatorDAO {
    public static creator getCreatorID(String Name) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL findCreator_id(?)");
            statement.setString(1, Name);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                int id = result.getInt("id");
                return new creator(id, Name);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(creatorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(creatorDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
}

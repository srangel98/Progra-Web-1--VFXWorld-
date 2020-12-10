/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.dao;

import com.mycompany.vfxworld.models.register;
import com.mycompany.vfxworld.utils.dbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author 52811
 */
public class registerDAO {
    
    public static register getRegisteredID(String Name) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL findUser_id(?)");
            statement.setString(1, Name);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                int id = result.getInt("id");
                int id_mod = result.getInt("id_mod");
                String suspendedTime = result.getString("suspendedTime");
                String aboutMe = result.getString("aboutMe");
                //obtenemos la fecha de hoy
                /*String pattern = "yyyy-MM-dd";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                String date = simpleDateFormat.format(new Date());
                
                boolean ban = false;
                if(date.compareTo(suspendedTime) > 0){
                   ban = false;
                } else{
                    ban = true;
                }*/
                
                return new register(id, Name, id_mod, suspendedTime, aboutMe);
            }
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

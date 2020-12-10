/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.dao;

import com.mycompany.vfxworld.models.comment;
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
public class commentDAO {
    
    public static int insertComment(comment Comentario) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL insertComment(?,?,?,?,?, ?);");
            statement.setString(1, Comentario.getBody());
            statement.setBoolean(2, Comentario.getIsAnon());
            statement.setBoolean(3, Comentario.getIsReply());
            statement.setString(4, Comentario.getNameUser());
            statement.setInt(5, Comentario.getIdNews());
            statement.setString(6, Comentario.getPhotoUser());
            return statement.executeUpdate();
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
        return 0;
    }
    
    public static List<comment> getAllComments() {
        Connection con = null;
        try {
            List<comment> comentarios = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getAllComments()");
            ResultSet result = statement.executeQuery();
            while (result.next()){
                int id = result.getInt("id");
                String body = result.getString("body");
                int rate = result.getInt("rate");
                boolean isAnon = result.getBoolean("isAnon");
                boolean isReply = result.getBoolean("isReply");
                String nameUser = result.getString("nameUser");
                int idNews = result.getInt("idNews");
                String photoUser = result.getString("photoUser");
                
                comentarios.add(new comment(id, body, rate, isAnon, isReply, nameUser, idNews, photoUser));
            }
            return comentarios;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public static List<comment> getAllReplies() {
        Connection con = null;
        try {
            List<comment> respuestas = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getAllReplies()");
            ResultSet result = statement.executeQuery();
            while (result.next()){
                int id = result.getInt("id");
                String body = result.getString("body");
                int rate = result.getInt("rate");
                boolean isAnon = result.getBoolean("isAnon");
                boolean isReply = result.getBoolean("isReply");
                String nameUser = result.getString("nameUser");
                int idNews = result.getInt("idNews");
                String photoUser = result.getString("photoUser");
                
                respuestas.add(new comment(id, body, rate, isAnon, isReply, nameUser, idNews, photoUser));
            }
            return respuestas;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
}

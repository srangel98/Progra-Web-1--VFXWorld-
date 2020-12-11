/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.vfxworld.dao;

import com.mycompany.vfxworld.models.news;
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
public class newsDAO {

    public static int createNews(news Noticia) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL createNews(?, ?, ?, ?, ?, ?, ?, ?, ?);");
            statement.setString(1, Noticia.getTitle());
            statement.setString(2, Noticia.getDescription());
            statement.setString(3, Noticia.getCategory());
            statement.setString(4, Noticia.getBody());
            statement.setString(5, Noticia.getVideos());
            statement.setString(6, Noticia.getMiniImage());
            statement.setString(7, Noticia.getHeaderImage());
            statement.setString(8, Noticia.getBodyImage());
            statement.setString(9, Noticia.getAutor());
            String prueba = Noticia.getAutor();
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
    
    public static int createApprovedNews(news Noticia) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL createNewsApproved(?, ?, ?, ?, ?, ?, ?, ?, ?);");
            statement.setString(1, Noticia.getTitle());
            statement.setString(2, Noticia.getDescription());
            statement.setString(3, Noticia.getCategory());
            statement.setString(4, Noticia.getBody());
            statement.setString(5, Noticia.getVideos());
            statement.setString(6, Noticia.getMiniImage());
            statement.setString(7, Noticia.getHeaderImage());
            statement.setString(8, Noticia.getBodyImage());
            statement.setString(9, Noticia.getAutor());
            String prueba = Noticia.getAutor();
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

    public static List<news> getNewsAutor(String autor) {
        Connection con = null;
        try {
            List<news> noticiasAutor = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getNewsAutor(?)");
            statement.setString(1, autor);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                String title = result.getString("title");
                String description = result.getString("description");
                String body = result.getString("body");
                String category = result.getString("category");
                int rate = result.getInt("rate");
                int approved = result.getInt("approved");
                String feedback = result.getString("feedback");
                String miniImage = result.getString("miniImage");
                String headerImage = result.getString("headerImage");
                String bodyImage = result.getString("bodyImage");
                String videos = result.getString("videos");
                String creator = result.getString("creator");

                noticiasAutor.add(new news(id, title, description, body, category, rate, approved, feedback, miniImage, headerImage, bodyImage, videos, creator));
            }
            return noticiasAutor;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public static news getNewsID(int pId) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getNewsID(?)");
            statement.setInt(1, pId);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                String title = result.getString("title");
                String description = result.getString("description");
                String body = result.getString("body");
                String category = result.getString("category");
                int rate = result.getInt("rate");
                int approved = result.getInt("approved");
                String feedback = result.getString("feedback");
                String miniImage = result.getString("miniImage");
                String headerImage = result.getString("headerImage");
                String bodyImage = result.getString("bodyImage");
                String videos = result.getString("videos");
                String creator = result.getString("creator");
                return new news(id, title, description, body, category, rate, approved, feedback, miniImage, headerImage, bodyImage, videos, creator);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public static List<news> getAllNews() {
        Connection con = null;
        try {
            List<news> noticias = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getAllNews()");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                String title = result.getString("title");
                String description = result.getString("description");
                String body = result.getString("body");
                String category = result.getString("category");
                int rate = result.getInt("rate");
                int approved = result.getInt("approved");
                String feedback = result.getString("feedback");
                String miniImage = result.getString("miniImage");
                String headerImage = result.getString("headerImage");
                String bodyImage = result.getString("bodyImage");
                String videos = result.getString("videos");
                String creator = result.getString("creator");

                noticias.add(new news(id, title, description, body, category, rate, approved, feedback, miniImage, headerImage, bodyImage, videos, creator));
            }
            return noticias;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public static int notApprovedNew(int id, String feedback) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL deniedNew(?,?);");
            statement.setInt(1, id);
            statement.setString(2, feedback);

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

    public static int approvedNew(int id) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL approvedNew(?);");
            statement.setInt(1, id);
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

    public static boolean isNewMarkedbyUser(String userName, int idNews) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            if (userName == null) {
                return false;

            } else {
                CallableStatement statement = con.prepareCall("CALL isNewMarked(?, ?);");
                statement.setString(1, userName);
                statement.setInt(2, idNews);

                ResultSet result = statement.executeQuery();
                while (result.next()) {
                userName = result.getString("nameUser");
                idNews = result.getInt("idNews");
                
                return true;
            }
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
        return false;
    }

    public static int markNewbyUser(String name, int idNew) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL markNew(?, ?);");
            statement.setString(1, name);
            statement.setInt(2, idNew);
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
    
    public static int unmarkNewbyUser(String name, int idNew) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL unmarkNew(?, ?);");
            statement.setString(1, name);
            statement.setInt(2, idNew);
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
    
    public static List<news> getFavNewsID(String name) {
        Connection con = null;
        try {
            List<news> idsNoticias = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getIdNewsFavourite(?)");
            statement.setString(1, name);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id = result.getInt("idNews");

                idsNoticias.add(new news(id));
            }
            return idsNoticias;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(newsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
}
